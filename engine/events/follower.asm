SECTION "Follower Script", ROMX
FollowerScript::
	faceplayer
	opentext
	followcry
	callasm CheckFollowerHasStatusCondition
	readmem wScriptVar2
	iftrue .done
	callasm FollowerInteractionLocations
.done
	waitbutton
	closetext
	end

MACRO interaction
	map_id \1
	dw \2
ENDM

FollowerInteractionLocationsTable:
	interaction ROUTE_29,                      Route29Interaction
	interaction ROUTE_30,                      Route30Interaction
	interaction ROUTE_31,                      Route31Interaction
	interaction DARK_CAVE_VIOLET_ENTRANCE,     DarkCaveInteraction
	interaction DARK_CAVE_BLACKTHORN_ENTRANCE, DarkCaveInteraction
	db -1

FollowerInteractionLocations:
	call StoreFollowerNickInBuffer
	ld hl, FollowerInteractionLocationsTable
.loop
	ld a, [hli]
	cp -1
	jp z, FollowerDefaultInteraction
	ld d, a
	ld a, [hli]
	ld e, a
	ld a, [wMapGroup]
	cp d
	jr nz, .next_entry
	ld a, [wMapNumber]
	cp e
	jr z, .got_map
.next_entry
	inc hl
	inc hl
	jr .loop
.got_map
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	push de
	pop hl
	jp _hl_
; fallthrough
FollowerDefaultInteraction:
	ld a, [hROMBank]
	ld b, a
	ld hl, DefaultInteractionText
	jp MapTextbox

DefaultInteractionText:
	text "TEST"
	done

Route29Interaction:
	ld a, [wFollowerSpriteID]
	cp CHIKORITA
	jr nz, FollowerDefaultInteraction
	call Random
	and 1
	ldh a, [hROMBank]
	ld b, a
	ld hl, Route29Text1
	jp z, MapTextbox
	ld hl, Route29Text2
	jp MapTextbox

Route29Text1:
	text "@"
	text_ram wStringBuffer1
	text " is"
	line "waving its leaf"
	cont "around."
	done

Route29Text2:
	text "@"
	text_ram wStringBuffer1
	text " is"
	line "making its leaf"
	cont "twitch."
	done

Route30Interaction:
	ld a, [wFollowerSpriteID]
	cp TOTODILE
	jr nz, FollowerDefaultInteraction
	call Random
	and 1
	ldh a, [hROMBank]
	ld b, a
	ld hl, Route30Text1
	jp z, MapTextbox
	ld hl, Route30Text2
	jp MapTextbox

Route30Text1:
	text "@"
	text_ram wStringBuffer1
	text " is"
	line "moving its jaw."
	done

Route30Text2:
	text "@"
	text_ram wStringBuffer1
	text " is"
	line "opening and"
	cont "closing its mouth."
	done

Route31Interaction:
	ld a, [wFollowerSpriteID]
	cp CYNDAQUIL
	jp nz, FollowerDefaultInteraction
	call Random
	and 1
	ldh a, [hROMBank]
	ld b, a
	ld hl, Route31Text1
	jp z, MapTextbox
	ld hl, Route31Text2
	jp MapTextbox

Route31Text1:
	text "@"
	text_ram wStringBuffer1
	text " blew"
	line "out a couple of"
	cont "fireballs."
	done

Route31Text2:
	text "@"
	text_ram wStringBuffer1
	line "blew out a"
	cont "fireball…"
	done

DarkCaveInteraction:
	ld a, [wFollowerSpriteID]
	ld [wCurSpecies], a
	call GetBaseData
	ld a, [wBaseType1]
	cp ICE
	jr z, .ice_type
	ld a, [wBaseType2]
	cp ICE
	jp nz, FollowerDefaultInteraction
.ice_type
	ldh a, [hROMBank]
	ld b, a
	ld hl, DarkCaveText
	jp MapTextbox

DarkCaveText:
	text "@"
	text_ram wStringBuffer1
	text " is"
	line "cheerful that it's"
	cont "become cold."
	done

StoreFollowerNickInBuffer:
	ld a, [wFollowerPartyNum]
	ld hl, wPartyMon1Nickname
	and a
	jr z, .done
	ld de, MON_NAME_LENGTH
.loop
	add hl, de
	dec a
	jr nz, .loop
.done
	ld de, wStringBuffer1
	ld bc, MON_NAME_LENGTH
	jp CopyBytes

CheckFollowerHasStatusCondition:
; Follower Condition has a higher priority than other interactions.
	ld a, [wFollowerPartyNum]
	ld [wCurPartyMon], a
	ld a, MON_STATUS
	call GetPartyParamLocation
	ld a, [hl]
	and SLP_MASK
	ld de, _AsleepScript
	jr nz, .run_script
	ld a, [hl]
	and (1 << PSN)
	ld de, _PoisonScript
	jr nz, .run_script
	ld a, [hl]
	and (1 << BRN)
	ld de, _BurnScript
	jr nz, .run_script
	ld a, [hl]
	and (1 << PAR)
	ld de, _ParalyzeScript
	jr nz, .run_script
	xor a
	ld [wScriptVar2], a
	ret

.run_script
	ldh a, [hROMBank]
	ld b, a
	farcall ScriptCall
	ld a, TRUE
	ld [wScriptVar2], a
	ret

_AsleepScript:
	showemote EMOTE_SLEEP, FOLLOWER, 40
	writetext .text
	end

.text:
	text "@"
	text_ram wStringBuffer1
	text " is"
	line "looking a little"
	cont "sleepy."
	done

_PoisonScript:
	showemote EMOTE_SAD, FOLLOWER, 40
	writetext .text
	end

.text:
	text "@"
	text_ram wStringBuffer1
	text " looks"
	line "rather ill."
	done

_BurnScript:
	showemote EMOTE_SHOCK, FOLLOWER, 40
	writetext .text
	end

.text:
	text "@"
	text_ram wStringBuffer1
	text " seems"
	line "to be in a little"
	cont "pain."
	done

_ParalyzeScript:
	showemote EMOTE_SHOCK, FOLLOWER, 40
	writetext .text
	end

.text:
	text "@"
	text_ram wStringBuffer1
	text " is"
	line "looking a little"
	cont "sluggish."
	done