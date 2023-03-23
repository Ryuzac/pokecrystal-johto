GOLDENRODGAMECORNERB1F_TM25_COINS EQU 5500
GOLDENRODGAMECORNERB1F_TM14_COINS EQU 5500
GOLDENRODGAMECORNERB1F_TM38_COINS EQU 5500
GOLDENRODGAMECORNERB1F_ABRA_COINS      EQU 100
GOLDENRODGAMECORNERB1F_CUBONE_COINS    EQU 800
GOLDENRODGAMECORNERB1F_WOBBUFFET_COINS EQU 1500

	object_const_def
	const GOLDENRODGAMECORNERB1F_CLERK
	const GOLDENRODGAMECORNERB1F_RECEPTIONIST1
	const GOLDENRODGAMECORNERB1F_RECEPTIONIST2
	const GOLDENRODGAMECORNERB1F_PHARMACIST1
	const GOLDENRODGAMECORNERB1F_PHARMACIST2
	const GOLDENRODGAMECORNERB1F_POKEFAN_M1
	const GOLDENRODGAMECORNERB1F_COOLTRAINER_M
	const GOLDENRODGAMECORNERB1F_POKEFAN_F
	const GOLDENRODGAMECORNERB1F_COOLTRAINER_F
	const GOLDENRODGAMECORNERB1F_GENTLEMAN
	const GOLDENRODGAMECORNERB1F_POKEFAN_M2
	const GOLDENRODGAMECORNERB1F_MOVETUTOR

GoldenrodGameCornerB1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, .MoveTutor

.MoveTutor:
	checkevent EVENT_BEAT_ELITE_FOUR
	iffalse .finish
	checkitem COIN_CASE
	iffalse .move_tutor_inside
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .move_tutor_outside
	ifequal SATURDAY, .move_tutor_outside
.move_tutor_inside
	appear GOLDENRODGAMECORNERB1F_MOVETUTOR
	endcallback

.move_tutor_outside
	checkflag ENGINE_DAILY_MOVE_TUTOR
	iftrue .finish
	disappear GOLDENRODGAMECORNERB1F_MOVETUTOR
.finish
	endcallback

MoveTutorInsideScript:
	faceplayer
	opentext
	writetext MoveTutorInsideText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNERB1F_MOVETUTOR, RIGHT
	end

GoldenrodGameCornerB1FCoinVendorScript:
	jumpstd GameCornerCoinVendorScript

GoldenrodGameCornerB1FTMVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerB1FPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GoldenrodGameCornerB1FPrizeVendor_NoCoinCaseScript
	writetext GoldenrodGameCornerB1FPrizeVendorWhichPrizeText
GoldenrodGameCornerB1FTMVendor_LoopScript:
	special DisplayCoinCaseBalance
	loadmenu GoldenrodGameCornerB1FTMVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Thunder
	ifequal 2, .Blizzard
	ifequal 3, .FireBlast
	sjump GoldenrodGameCornerB1FPrizeVendor_CancelPurchaseScript

.Thunder:
	checkcoins GOLDENRODGAMECORNERB1F_TM25_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerB1FPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_THUNDER
	scall GoldenrodGameCornerB1FPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerB1FPrizeVendor_CancelPurchaseScript
	giveitem TM_THUNDER
	iffalse GoldenrodGameCornerB1FPrizeMonVendor_NoRoomForPrizeScript
	takecoins GOLDENRODGAMECORNERB1F_TM25_COINS
	sjump GoldenrodGameCornerB1FTMVendor_FinishScript

.Blizzard:
	checkcoins GOLDENRODGAMECORNERB1F_TM14_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerB1FPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_BLIZZARD
	scall GoldenrodGameCornerB1FPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerB1FPrizeVendor_CancelPurchaseScript
	giveitem TM_BLIZZARD
	iffalse GoldenrodGameCornerB1FPrizeMonVendor_NoRoomForPrizeScript
	takecoins GOLDENRODGAMECORNERB1F_TM14_COINS
	sjump GoldenrodGameCornerB1FTMVendor_FinishScript

.FireBlast:
	checkcoins GOLDENRODGAMECORNERB1F_TM38_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerB1FPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_FIRE_BLAST
	scall GoldenrodGameCornerB1FPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerB1FPrizeVendor_CancelPurchaseScript
	giveitem TM_FIRE_BLAST
	iffalse GoldenrodGameCornerB1FPrizeMonVendor_NoRoomForPrizeScript
	takecoins GOLDENRODGAMECORNERB1F_TM38_COINS
	sjump GoldenrodGameCornerB1FTMVendor_FinishScript

GoldenrodGameCornerB1FPrizeVendor_ConfirmPurchaseScript:
	writetext GoldenrodGameCornerB1FPrizeVendorConfirmPrizeText
	yesorno
	end

GoldenrodGameCornerB1FTMVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerB1FPrizeVendorHereYouGoText
	waitbutton
	sjump GoldenrodGameCornerB1FTMVendor_LoopScript

GoldenrodGameCornerB1FPrizeVendor_NotEnoughCoinsScript:
	writetext GoldenrodGameCornerB1FPrizeVendorNeedMoreCoinsText
	waitbutton
	closetext
	end

GoldenrodGameCornerB1FPrizeMonVendor_NoRoomForPrizeScript:
	writetext GoldenrodGameCornerB1FPrizeVendorNoMoreRoomText
	waitbutton
	closetext
	end

GoldenrodGameCornerB1FPrizeVendor_CancelPurchaseScript:
	writetext GoldenrodGameCornerB1FPrizeVendorQuitText
	waitbutton
	closetext
	end

GoldenrodGameCornerB1FPrizeVendor_NoCoinCaseScript:
	writetext GoldenrodGameCornerB1FPrizeVendorNoCoinCaseText
	waitbutton
	closetext
	end

GoldenrodGameCornerB1FTMVendorMenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "TM25    5500@"
	db "TM14    5500@"
	db "TM38    5500@"
	db "CANCEL@"

GoldenrodGameCornerB1FPrizeMonVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerB1FPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GoldenrodGameCornerB1FPrizeVendor_NoCoinCaseScript
.loop
	writetext GoldenrodGameCornerB1FPrizeVendorWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Abra
	ifequal 2, .Cubone
	ifequal 3, .Wobbuffet
	sjump GoldenrodGameCornerB1FPrizeVendor_CancelPurchaseScript

.Abra:
	checkcoins GOLDENRODGAMECORNERB1F_ABRA_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerB1FPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, GoldenrodGameCornerB1FPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, ABRA
	scall GoldenrodGameCornerB1FPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerB1FPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerB1FPrizeVendorHereYouGoText
	waitbutton
	setval ABRA
	special GameCornerPrizeMonCheckDex
	givepoke ABRA, 5
	takecoins GOLDENRODGAMECORNERB1F_ABRA_COINS
	sjump .loop

.Cubone:
	checkcoins GOLDENRODGAMECORNERB1F_CUBONE_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerB1FPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, GoldenrodGameCornerB1FPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, CUBONE
	scall GoldenrodGameCornerB1FPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerB1FPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerB1FPrizeVendorHereYouGoText
	waitbutton
	setval CUBONE
	special GameCornerPrizeMonCheckDex
	givepoke CUBONE, 15
	takecoins GOLDENRODGAMECORNERB1F_CUBONE_COINS
	sjump .loop

.Wobbuffet:
	checkcoins GOLDENRODGAMECORNERB1F_WOBBUFFET_COINS
	ifequal HAVE_LESS, GoldenrodGameCornerB1FPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, GoldenrodGameCornerB1FPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, WOBBUFFET
	scall GoldenrodGameCornerB1FPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCornerB1FPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCornerB1FPrizeVendorHereYouGoText
	waitbutton
	setval WOBBUFFET
	special GameCornerPrizeMonCheckDex
	givepoke WOBBUFFET, 15
	takecoins GOLDENRODGAMECORNERB1F_WOBBUFFET_COINS
	sjump .loop

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 17, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 4 ; items
	db "ABRA        100@"
	db "CUBONE      800@"
	db "WOBBUFFET  1500@"
	db "CANCEL@"

GoldenrodGameCornerB1FPharmacistScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerB1FPharmacistText
	waitbutton
	closetext
	turnobject LAST_TALKED, LEFT
	end

GoldenrodGameCornerB1FPokefanM1Script:
	faceplayer
	opentext
	writetext GoldenrodGameCornerB1FPokefanM1Text
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNERB1F_POKEFAN_M1, RIGHT
	end

GoldenrodGameCornerB1FCooltrainerMScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerB1FCooltrainerMText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNERB1F_COOLTRAINER_M, LEFT
	end

GoldenrodGameCornerB1FPokefanFScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerB1FPokefanFText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNERB1F_POKEFAN_F, RIGHT
	end

GoldenrodGameCornerB1FCooltrainerFScript:
	jumptextfaceplayer GoldenrodGameCornerB1FCooltrainerFText

GoldenrodGameCornerB1FGentlemanScript:
	faceplayer
	opentext
	writetext GoldenrodGameCornerB1FGentlemanText
	waitbutton
	closetext
	turnobject GOLDENRODGAMECORNERB1F_GENTLEMAN, RIGHT
	end

GoldenrodGameCornerB1FPokefanM2Script:
	jumptextfaceplayer GoldenrodGameCornerB1FPokefanM2Text

GoldenrodGameCornerB1FLeftTheirDrinkScript:
	jumptext GoldenrodGameCornerB1FLeftTheirDrinkText

GoldenrodGameCornerB1FSlotsMachineScript:
	random 6
	ifequal 0, GoldenrodGameCornerB1FLuckySlotsMachineScript
	refreshscreen
	setval FALSE
	special SlotMachine
	closetext
	end

GoldenrodGameCornerB1FLuckySlotsMachineScript:
	refreshscreen
	setval TRUE
	special SlotMachine
	closetext
	end

GoldenrodGameCornerB1FCardFlipMachineScript:
	refreshscreen
	special CardFlip
	closetext
	end

GoldenrodGameCornerB1FDirectory:
	jumptext GoldenrodGameCornerB1FDirectoryText

GoldenrodGameCornerB1FPrizeVendorIntroText:
	text "Welcome!"

	para "We exchange your"
	line "game coins for"
	cont "fabulous prizes!"
	done

GoldenrodGameCornerB1FPrizeVendorWhichPrizeText:
	text "Which prize would"
	line "you like?"
	done

GoldenrodGameCornerB1FPrizeVendorConfirmPrizeText:
	text_ram wStringBuffer3
	text "."
	line "Is that right?"
	done

GoldenrodGameCornerB1FPrizeVendorHereYouGoText:
	text "Here you go!"
	done

GoldenrodGameCornerB1FPrizeVendorNeedMoreCoinsText:
	text "Sorry! You need"
	line "more coins."
	done

GoldenrodGameCornerB1FPrizeVendorNoMoreRoomText:
	text "Sorry. You can't"
	line "carry any more."
	done

GoldenrodGameCornerB1FPrizeVendorQuitText:
	text "OK. Please save"
	line "your coins and"
	cont "come again!"
	done

GoldenrodGameCornerB1FPrizeVendorNoCoinCaseText:
	text "Oh? You don't have"
	line "a COIN CASE."
	done

GoldenrodGameCornerB1FPharmacistText:
	text "I always play this"
	line "slot machine. It"

	para "pays out more than"
	line "others, I think."
	done

GoldenrodGameCornerB1FPokefanM1Text:
	text "I just love this"
	line "new slot machine."

	para "It's more of a"
	line "challenge than the"
	cont "ones in CELADON."
	done

GoldenrodGameCornerB1FCooltrainerMText:
	text "Life is a gamble."
	line "I'm going to flip"
	cont "cards till I drop!"
	done

GoldenrodGameCornerB1FPokefanFText:
	text "Card flip…"

	para "I prefer it over"
	line "the slots because"

	para "it's easier to"
	line "figure the odds."

	para "But the payout is"
	line "much lower."
	done

GoldenrodGameCornerB1FCooltrainerFText:
	text "I won't quit until"
	line "I win!"
	done

GoldenrodGameCornerB1FGentlemanText:
	text "I taught BLIZZARD"
	line "to my #MON."

	para "It was hard to get"
	line "enough coins for"

	para "it, but it was"
	line "worth it."
	done

GoldenrodGameCornerB1FPokefanM2Text:
	text "I couldn't win at"
	line "the slots, and I"

	para "blew it on card"
	line "flipping…"

	para "I got so furious,"
	line "I tossed out my"

	para "COIN CASE in the"
	line "UNDERGROUND."
	done

MoveTutorInsideText:
	text "Wahahah! The coins"
	line "keep rolling in!"
	done

GoldenrodGameCornerB1FLeftTheirDrinkText:
	text "Someone left their"
	line "drink."

	para "It smells sweet."
	done

GoldenrodGameCornerB1FDirectoryText:
	text "B1F SLOTS"
	line "    CARD FLIP"

	para "1F VOLTORB FLIP"
	done

GoldenrodGameCornerB1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 13, GOLDENROD_UNDERGROUND, 7
	warp_event  3, 13, GOLDENROD_UNDERGROUND, 8
	warp_event  9,  0, GOLDENROD_GAME_CORNER_1F, 3

	def_coord_events

	def_bg_events
	bg_event  6,  6, BGEVENT_READ,  GoldenrodGameCornerB1FSlotsMachineScript
	bg_event  6,  7, BGEVENT_READ,  GoldenrodGameCornerB1FSlotsMachineScript
	bg_event  6,  8, BGEVENT_READ,  GoldenrodGameCornerB1FSlotsMachineScript
	bg_event  6,  9, BGEVENT_READ,  GoldenrodGameCornerB1FSlotsMachineScript
	bg_event  6, 10, BGEVENT_READ,  GoldenrodGameCornerB1FSlotsMachineScript
	bg_event  6, 11, BGEVENT_RIGHT, GoldenrodGameCornerB1FSlotsMachineScript
	bg_event  7,  6, BGEVENT_READ,  GoldenrodGameCornerB1FSlotsMachineScript
	bg_event  7,  7, BGEVENT_READ,  GoldenrodGameCornerB1FLuckySlotsMachineScript
	bg_event  7,  8, BGEVENT_READ,  GoldenrodGameCornerB1FSlotsMachineScript
	bg_event  7,  9, BGEVENT_READ,  GoldenrodGameCornerB1FSlotsMachineScript
	bg_event  7, 10, BGEVENT_READ,  GoldenrodGameCornerB1FSlotsMachineScript
	bg_event  7, 11, BGEVENT_LEFT,  GoldenrodGameCornerB1FSlotsMachineScript
	bg_event 12,  6, BGEVENT_READ,  GoldenrodGameCornerB1FSlotsMachineScript
	bg_event 12,  7, BGEVENT_READ,  GoldenrodGameCornerB1FSlotsMachineScript
	bg_event 12,  8, BGEVENT_READ,  GoldenrodGameCornerB1FSlotsMachineScript
	bg_event 12,  9, BGEVENT_READ,  GoldenrodGameCornerB1FSlotsMachineScript
	bg_event 12, 10, BGEVENT_READ,  GoldenrodGameCornerB1FSlotsMachineScript
	bg_event 12, 11, BGEVENT_RIGHT, GoldenrodGameCornerB1FSlotsMachineScript
	bg_event 13,  6, BGEVENT_READ,  GoldenrodGameCornerB1FCardFlipMachineScript
	bg_event 13,  7, BGEVENT_READ,  GoldenrodGameCornerB1FCardFlipMachineScript
	bg_event 13,  8, BGEVENT_READ,  GoldenrodGameCornerB1FCardFlipMachineScript
	bg_event 13,  9, BGEVENT_READ,  GoldenrodGameCornerB1FCardFlipMachineScript
	bg_event 13, 10, BGEVENT_READ,  GoldenrodGameCornerB1FCardFlipMachineScript
	bg_event 13, 11, BGEVENT_LEFT,  GoldenrodGameCornerB1FCardFlipMachineScript
	bg_event 18,  6, BGEVENT_READ,  GoldenrodGameCornerB1FCardFlipMachineScript
	bg_event 18,  7, BGEVENT_READ,  GoldenrodGameCornerB1FCardFlipMachineScript
	bg_event 18,  8, BGEVENT_READ,  GoldenrodGameCornerB1FCardFlipMachineScript
	bg_event 18,  9, BGEVENT_READ,  GoldenrodGameCornerB1FCardFlipMachineScript
	bg_event 18, 10, BGEVENT_READ,  GoldenrodGameCornerB1FCardFlipMachineScript
	bg_event 18, 11, BGEVENT_RIGHT, GoldenrodGameCornerB1FCardFlipMachineScript
	bg_event 12,  1, BGEVENT_LEFT, GoldenrodGameCornerB1FLeftTheirDrinkScript
	bg_event  8,  0, BGEVENT_READ, GoldenrodGameCornerB1FDirectory

	def_object_events
	object_event  3,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerB1FCoinVendorScript, -1
	object_event 16,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerB1FTMVendorScript, -1
	object_event 18,  2, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerB1FPrizeMonVendorScript, -1
	object_event  8,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, DAY, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerB1FPharmacistScript, -1
	object_event  8,  7, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, NITE, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerB1FPharmacistScript, -1
	object_event 11, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerB1FPokefanM1Script, -1
	object_event 14,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerB1FCooltrainerMScript, -1
	object_event 17,  6, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerB1FPokefanFScript, -1
	object_event 10,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WANDER, 2, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerB1FCooltrainerFScript, -1
	object_event  5, 10, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerB1FGentlemanScript, -1
	object_event  2,  9, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCornerB1FPokefanM2Script, -1
	object_event 17, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MoveTutorInsideScript, EVENT_GOLDENROD_GAME_CORNER_MOVE_TUTOR
