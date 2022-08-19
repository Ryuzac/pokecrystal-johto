LinkMovementIncrementPointer:
; Input: hl: Pointer to Ring Buffer, bc: pointer that needs incrementing
; Output: hl: preserved, bc: Incremented Pointer
; Clobbers de
	push hl

	; Set hl to end of buffer
	ld a, LINK_MOVE_BUFFER_SIZE
	ld d, 0
	ld e, a
	add hl, de

	; Increment bc
	inc bc

	; check if bc is equal to end of buffer
	ld a, h
	cp b
	jr nz, .return
	ld a, l
	cp c
	jr nz, .return

	; Is equal to end of buffer, need to wrap around.
	; Set bc equal to start of Ring Buffer.
	pop hl
	ld a, h
	ld b, a
	ld a, l
	ld c, a
	ret

.return
	pop hl
	ret

LinkMovementCheckPointersEqual:
; Input: bc: 1st pointer, de: 2nd pointer
; Output: Sets Z flag if equal.
	ld a, b
	cp d
	ret nz
	ld a, c
	cp e
	ret

LinkMovementStoreByte::
; Input: hl: Ring buffer to store in. a: byte to store
; Output: Z flag if buffer is full.
	push af
	push hl

	dec hl
	ld a, [hld]
	ld c, a
	ld [wLinkMovementTempPointer + 1], a
	ld a, [hld]
	ld b, a
	ld [wLinkMovementTempPointer], a

	ld a, [hld]
	ld e, a
	ld a, [hl]
	ld d, a

	pop hl
	push de
	call LinkMovementIncrementPointer
	pop de

	call LinkMovementCheckPointersEqual
	jr nz, .continue
	ld a, [bc]
	cp SERIAL_NO_DATA_BYTE
	jr nz, .return_and_pop
	pop af
	ld [bc], a
	ret
.continue
	; Restore original bc into de
	ld a, [wLinkMovementTempPointer]
	ld d, a
	ld a, [wLinkMovementTempPointer + 1]
	ld e, a

	pop af
	; Store byte in Ring
	ld [de], a

	; Store incremented pointer
	dec hl
	ld a, c
	ld [hld], a
	ld a, b
	ld [hl], a
	ret

.return_and_pop
	pop af
	ret

LinkMovementGetByte::
; Input: hl: Ring buffer to get byte from
; Output: a: Byte from buffer, Z flag if buffer is empty
	push hl

	dec hl
	ld a, [hld]
	ld e, a
	ld a, [hld]
	ld d, a

	ld a, [hld]
	ld c, a
	ld [wLinkMovementTempPointer + 1], a
	ld a, [hl]
	ld b, a
	ld [wLinkMovementTempPointer], a

	ld a, [bc]
	ld [wLinkMovementTempByte], a

	pop hl
	push de
	call LinkMovementIncrementPointer
	pop de

	call LinkMovementCheckPointersEqual
	jr nz, .continue
	ld a, [wLinkMovementTempByte]
	cp SERIAL_NO_DATA_BYTE
	ret z
	push af
	ld a, [wLinkMovementTempPointer]
	ld b, a
	ld a, [wLinkMovementTempPointer + 1]
	ld c, a
	ld a, SERIAL_NO_DATA_BYTE
	ld [bc], a
	pop af
	ret

.continue
	; Store incremented pointer
	rept 3
		dec hl
	endr
	ld a, c
	ld [hld], a
	ld a, b
	ld [hl], a

	; Restore original bc into de
	ld a, [wLinkMovementTempPointer]
	ld d, a
	ld a, [wLinkMovementTempPointer + 1]
	ld e, a

	; Get byte from incremeted pointer and return
	ld a, [de]
	push af
	ld a, SERIAL_NO_DATA_BYTE
	ld [de], a
	pop af
	ret

LinkExchangeMovementData::
	ld a, [wLinkWalkEnabled]
	dec a
	ret nz
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr nz, .player_1
	ldh a, [rSC]
	bit rSC_ON, a
	ret nz
	ld a, [wLinkWalkDelay]
	sub a, $50
	ld [wLinkWalkDelay], a
	ret nc
	ld a, (0 << rSC_ON) | (1 << rSC_CLOCK)
	ldh [rSC], a
	ld a, (1 << rSC_ON) | (1 << rSC_CLOCK)
	ldh [rSC], a
	;ret
.player_1
	ld a, [hSerialSend]
	cp SERIAL_NO_DATA_BYTE
	ret nz
.send_movement
	ld hl, wLinkMovementSendRingBuffer
	call LinkMovementGetByte
	jr nz, .send
	ld a, SERIAL_NO_DATA_BYTE
.send
	ld [hSerialSend], a
	ret

LinkMovementReceive::
	ld a, [wLinkWalkEnabled]
	dec a
	ret nz
	ld a, [hSerialReceive]
	cp SERIAL_NO_DATA_BYTE
	ret z
	and a
	ret z
	ld hl, wLinkMovementReceivedRingBuffer
	call LinkMovementStoreByte
	ld a, SERIAL_NO_DATA_BYTE
	ld [hSerialReceive], a
	jr LinkExchangeMovementData.send_movement


LinkDoMovement::
	push bc
	push de
	ldh a, [hROMBank]
	push af
	ld a, BANK(MovementPointers)
	rst Bankswitch

	ld a, [wObject1Action]
	dec a
	jr nz, .return

	ld hl, wLinkMovementReceivedRingBuffer
	call LinkMovementGetByte
	jr z, .return
	ld hl, LinkMovementData
	ld de, 1
	call IsInArray
	jr nc, .return

	ld hl, LinkMovementData
	ld c, b
	ld b, 0
	add hl, bc
	ld a, [hl]

	ld bc, wObject1Sprite
	ld hl, MovementPointers
	rst JumpTable
.return
	pop af
	rst Bankswitch
	pop de
	pop bc
	ret

LinkMovementData:
	step DOWN
	step UP
	step LEFT
	step RIGHT
	turn_step DOWN
	turn_step UP
	turn_step LEFT
	turn_step RIGHT
	db -1
