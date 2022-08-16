InitMovementBuffer::
	ld [wMovementBufferObject], a
	xor a
	ld [wMovementBufferCount], a
	ld a, $0 ; was BANK(wMovementBuffer) in G/S
	ld [wUnusedMovementBufferBank], a
	ld a, LOW(wMovementBuffer)
	ld [wUnusedMovementBufferPointer], a
	ld a, HIGH(wMovementBuffer)
	ld [wUnusedMovementBufferPointer + 1], a
	ret

DecrementMovementBufferCount::
	ld a, [wMovementBufferCount]
	and a
	ret z
	dec a
	ld [wMovementBufferCount], a
	ret

AppendToMovementBuffer::
	push hl
	push de
	ld hl, wMovementBufferCount
	ld e, [hl]
	inc [hl]
	ld d, 0
	ld hl, wMovementBuffer
	add hl, de
	ld [hl], a
	pop de
	pop hl
	ret

AppendToMovementBufferNTimes::
	push af
	ld a, c
	and a
	jr nz, .okay
	pop af
	ret

.okay
	pop af
.loop
	call AppendToMovementBuffer
	dec c
	jr nz, .loop
	ret

ComputePathToWalkToPlayer::
	push af
; compare x coords, load left/right into h, and x distance into d
	ld a, b
	sub d
	ld h, LEFT
	jr nc, .got_x_distance
	dec a
	cpl
	ld h, RIGHT

.got_x_distance
	ld d, a
; compare y coords, load up/down into l, and y distance into e
	ld a, c
	sub e
	ld l, UP
	jr nc, .got_y_distance
	dec a
	cpl
	ld l, DOWN

.got_y_distance
	ld e, a
; if the x distance is less than the y distance, swap h and l, and swap d and e
	cp d
	jr nc, .done
	ld a, h
	ld h, l
	ld l, a
	ld a, d
	ld d, e
	ld e, a

.done
	pop af
	ld b, a
; Add movement in the longer direction first...
	ld a, h
	call .GetMovementData
	ld c, d
	call AppendToMovementBufferNTimes
; ... then add the shorter direction.
	ld a, l
	call .GetMovementData
	ld c, e
	call AppendToMovementBufferNTimes
	ret

.GetMovementData:
	push de
	push hl
	ld l, b
	ld h, 0
	add hl, hl
	add hl, hl
	ld e, a
	ld d, 0
	add hl, de
	ld de, .MovementData
	add hl, de
	ld a, [hl]
	pop hl
	pop de
	ret

.MovementData:
	slow_step DOWN
	slow_step UP
	slow_step LEFT
	slow_step RIGHT
	step DOWN
	step UP
	step LEFT
	step RIGHT
	big_step DOWN
	big_step UP
	big_step LEFT
	big_step RIGHT

LinkExchangeMovementData::
	ld a, [wLinkWalkEnabled]
	dec a
	ret nz
	ldh a, [hSerialReceive]
	cp SERIAL_NO_DATA_BYTE
	jr z, .no_data_received
	ld [wOtherPlayerMovement], a
.no_data_received
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
	ld a, [wPlayerMovement]
	cp movement_step_sleep
	jr nz, .not_sleep1
	ld a, SERIAL_NO_DATA_BYTE
.not_sleep1
	ldh [hSerialSend], a
	ld a, (0 << rSC_ON) | (1 << rSC_CLOCK)
	ldh [rSC], a
	ld a, (1 << rSC_ON) | (1 << rSC_CLOCK)
	ldh [rSC], a
	ret
.player_1
	ld a, [wPlayerMovement]
	cp movement_step_sleep
	jr nz, .not_sleep2
	ld a, SERIAL_NO_DATA_BYTE
.not_sleep2
	ldh [hSerialSend], a
	ret

LinkDoMovement::
	ld a, [wLinkWalkEnabled]
	dec a
	ret nz
	call CheckScript
	ret nz
	call StartScript
	farcall CableClubCheckWhichChris
	ld a, [wScriptVar]
	dec a
	ld a, COLOSSEUM_LINK_TRAINER2
	jr nz, .Chris2
	ld a, COLOSSEUM_LINK_TRAINER1
.Chris2
	call GetScriptObject
	ld c, a

	ld a, [wOtherPlayerMovement]
	ld b, a

	ld hl, .MovementData
	ld de, 1
	push bc
	call IsInArray
	pop bc
	jr nc, .return

	ld a, b
	ld hl, hOtherPlayerMovementScript
	ld [hli], a
	ld a, movement_step_end
	ld [hl], a
	dec hl
	xor a
	ld b, a
	call GetMovementData
.return
	ld a, SERIAL_NO_DATA_BYTE
	ld [wOtherPlayerMovement], a
	ret c
	ld a, SCRIPT_WAIT_MOVEMENT
	ld [wScriptMode], a
	jp StopScript

.MovementData
	step DOWN
	step UP
	step LEFT
	step RIGHT
	db -1
