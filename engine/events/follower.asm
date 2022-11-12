SECTION "Follower Script", ROMX
FollowerScript::
	faceplayer
	callasm DoFollowerInteraction
	end

MACRO interaction
	db \1 ; species
	db \2 ; type inclusion
	db \3 ; type exclusion
	db \4 ; landmark
	db \5 ; time
	db \6 ; status
	dw \7 ; script
ENDM

DEF FOLLOWER_INT_TABLE_ROW_LENGTH EQU 8

FollowerInteractionTable:
; uses the first interaction that matches all of its conditions.
;	interaction species     type-incl type-excl landmark                time      status      script
	interaction -1,         -1,       -1,       -1,                     -1,       SLP_MASK,   SleepInteraction
	interaction -1,         -1,       -1,       -1,                     -1,       (1 << PSN), PoisonInteraction
	interaction -1,         -1,       -1,       -1,                     -1,       (1 << BRN), BurnInteraction
	interaction -1,         -1,       -1,       -1,                     -1,       (1 << FRZ), FrozenInteraction
	interaction -1,         -1,       -1,       -1,                     -1,       (1 << PAR), ParalyzeInteraction
	interaction CHIKORITA,  -1,       -1,       LANDMARK_ROUTE_29,      -1,       -1,         ChikoritaRoute29Interaction
	interaction TOTODILE,   -1,       -1,       LANDMARK_ROUTE_30,      -1,       -1,         TotodileRoute30Interaction
	interaction CYNDAQUIL,  -1,       -1,       LANDMARK_ROUTE_31,      -1,       -1,         CyndaquilRoute31Interaction
	interaction -1,         ICE,      -1,       LANDMARK_DARK_CAVE,     -1,       -1,         DarkCaveInteraction
	interaction BELLSPROUT, -1,       -1,       LANDMARK_SPROUT_TOWER,  -1,       -1,         BellsproutSproutTowerInteraction
	interaction UNOWN,      -1,       -1,       LANDMARK_RUINS_OF_ALPH, -1,       -1,         UnownRuinsOfAlphInteraction
	interaction -1,         -1,       -1,       -1,                     -1,       -1,         DefaultInteraction

DoFollowerInteraction:
	call StoreFollowerNickInBuffer
	ld hl, FollowerInteractionTable
	ld a, [wFollowerSpriteID]
	ld [wCurSpecies], a
	ld c, a
	call GetBaseData
	ld a, [wBaseType1]
	ld d, a
	ld a, [wBaseType2]
	ld e, a
.get_row
	ld b, FOLLOWER_INT_TABLE_ROW_LENGTH
	ld a, [hli]
	dec b
	inc a
	jr z, .check_type_inclusion
	dec a
	cp c
	jr nz, .next_row
.check_type_inclusion
	ld a, [hli]
	dec b
	inc a
	jr z, .check_type_exclusion
	dec a
	cp d
	jr z, .check_type_exclusion
	cp e
	jr nz, .next_row
.check_type_exclusion
	ld a, [hli]
	dec b
	inc a
	jr z, .check_landmark
	dec a
	cp d
	jr z, .next_row
	cp e
	jr z, .next_row
.check_landmark
	ld a, [hli]
	dec b
	inc a
	jr z, .check_time
	dec a
	push bc
	ld c, a
	ld a, [wCurLandmark]
	cp c
	pop bc
	jr nz, .next_row
.check_time
	ld a, [hli]
	dec b
	inc a
	jr z, .check_status
	dec a
	push bc
	ld c, a
	ld a, [wTimeOfDay]
	and c
	pop bc
	jr z, .next_row
.check_status
	ld a, [hli]
	dec b
	inc a
	jr z, .run_script
	dec a
	push bc
	ld c, a
	ld a, [wFollowerPartyNum]
	ld [wCurPartyMon], a
	ld a, MON_STATUS
	push hl
	call GetPartyParamLocation
	ld a, [hl]
	pop hl
	and c
	pop bc
	jr z, .next_row
.run_script
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	ldh a, [hROMBank]
	ld b, a
	farcall ScriptCall
	ret

.next_row
	push bc
	ld c, b
	ld b, 0
	add hl, bc
	pop bc
	jr .get_row

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


DefaultInteraction:
	opentext
	followcry
	writetext .text
	closetext
	end

.text:
	text "TEST"
	done

SleepInteraction:
	showemote EMOTE_SLEEP, FOLLOWER, 40
	opentext
	followcry
	writetext .text
	closetext
	end

.text:
	text "@"
	text_ram wStringBuffer1
	text " is"
	line "looking a little"
	cont "sleepy."
	done

PoisonInteraction:
	showemote EMOTE_SAD, FOLLOWER, 40
	opentext
	followcry
	writetext .text
	closetext
	end

.text:
	text "@"
	text_ram wStringBuffer1
	text " looks"
	line "rather ill."
	done

BurnInteraction:
	showemote EMOTE_SHOCK, FOLLOWER, 40
	opentext
	followcry
	writetext .text
	closetext
	end

.text:
	text "@"
	text_ram wStringBuffer1
	text " seems"
	line "to be in a little"
	cont "pain."
	done

FrozenInteraction:
	showemote EMOTE_SHOCK, PLAYER, 40
	opentext
	followcry
	writetext .text
	closetext
	end

.text:
	text "@"
	text_ram wStringBuffer1
	text " is"
	line "covered in ice!"
	done

ParalyzeInteraction:
	showemote EMOTE_BOLT, FOLLOWER, 40
	writetext .text
	end

.text:
	text "@"
	text_ram wStringBuffer1
	text " is"
	line "looking a little"
	cont "sluggish."
	done

ChikoritaRoute29Interaction:
	opentext
	followcry
	random 2
	iftrue .interaction2
	writetext .waving_leaf
	closetext
	end

.interaction2
	writetext .leaf_twitch
	closetext
	end

.waving_leaf:
	text "@"
	text_ram wStringBuffer1
	text " is"
	line "waving its leaf"
	cont "around."
	done

.leaf_twitch:
	text "@"
	text_ram wStringBuffer1
	text " is"
	line "making its leaf"
	cont "twitch."
	done

TotodileRoute30Interaction:
	opentext
	followcry
	random 2
	iftrue .interaction2
	writetext .moving_jaw
	closetext
	end

.interaction2
	writetext .open_close_mouth
	closetext
	end

.moving_jaw:
	text "@"
	text_ram wStringBuffer1
	text " is"
	line "moving its jaw."
	done

.open_close_mouth:
	text "@"
	text_ram wStringBuffer1
	text " is"
	line "opening and"
	cont "closing its mouth."
	done

CyndaquilRoute31Interaction:
	opentext
	followcry
	random 2
	iftrue .interaction2
	writetext .blew_couple_fireballs
	closetext
	end

.interaction2
	writetext .blew_a_fireball
	closetext
	end

.blew_couple_fireballs:
	text "@"
	text_ram wStringBuffer1
	text " blew"
	line "out a couple of"
	cont "fireballs."
	done

.blew_a_fireball:
	text "@"
	text_ram wStringBuffer1
	line "blew out a"
	cont "fireball…"
	done

DarkCaveInteraction:
	opentext
	followcry
	writetext .DarkCaveText
	closetext
	end

.DarkCaveText:
	text "@"
	text_ram wStringBuffer1
	text " is"
	line "cheerful that it's"
	cont "become cold."
	done

BellsproutSproutTowerInteraction:
	opentext
	followcry
	random 2
	iftrue .interaction2
	writetext .danced_as_pleased
	closetext
	end

.interaction2
	writetext .danced_strange_manner
	closetext
	end

.danced_as_pleased:
	text "@"
	text_ram wStringBuffer1
	text " swayed"
	line "and danced around"
	cont "as it pleased."
	done

.danced_strange_manner:
	text "@"
	text_ram wStringBuffer1
	text " swayed"
	line "around, dancing in"
	cont "a strange manner."
	done

UnownRuinsOfAlphInteraction:
	opentext
	followcry
	random 5
	ifequal 1, .interaction2
	ifequal 2, .interaction3
	ifequal 3, .interaction4
	ifequal 4, .interaction5
	writetext .StrangeSoundText
	closetext
	end

.interaction2
	applymovement FOLLOWER, .FollowerSpinMovement
	faceplayer
	writetext .StartedSpinningText
	closetext
	end

.interaction3
	writetext .GrowlingText
	closetext
	end

.interaction4
	writetext .NotMovingText
	closetext
	end

.interaction5
	writetext .SingingText
	closetext
	end

.StrangeSoundText:
	text "A strange sound is"
	line "coming from"
	cont "@"
	text_ram wStringBuffer1
	text "…"
	done

.StartedSpinningText:
	text "@"
	text_ram wStringBuffer1
	text "…"
	line "started spinning"
	cont "around in circles."
	done

.FollowerSpinMovement:
	turn_head DOWN
	step_sleep 4
	turn_head LEFT
	step_sleep 4
	turn_head UP
	step_sleep 4
	turn_head RIGHT
	step_sleep 4
	turn_head DOWN
	step_sleep 4
	turn_head LEFT
	step_sleep 4
	turn_head UP
	step_sleep 4
	turn_head RIGHT
	step_sleep 4
	step_end

.GrowlingText:
	text "@"
	text_ram wStringBuffer1
	text " is"
	line "growling in a way"

	para "that sounds like"
	line "speech…"
	done

.NotMovingText:
	text "Your #MON"
	line "isn't moving."
	done

.SingingText:
	text "Your #MON"
	line "seems to be"
	cont "singing something?"
	done
