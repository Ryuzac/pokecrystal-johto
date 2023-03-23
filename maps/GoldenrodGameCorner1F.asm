GOLDENRODGAMECORNER1F_TM25_COINS EQU 5500
GOLDENRODGAMECORNER1F_TM14_COINS EQU 5500
GOLDENRODGAMECORNER1F_TM38_COINS EQU 5500
GOLDENRODGAMECORNER1F_ABRA_COINS      EQU 100
GOLDENRODGAMECORNER1F_CUBONE_COINS    EQU 800
GOLDENRODGAMECORNER1F_WOBBUFFET_COINS EQU 1500

	object_const_def
	const GOLDENRODGAMECORNER1F_CLERK
	const GOLDENRODGAMECORNER1F_RECEPTIONIST1
	const GOLDENRODGAMECORNER1F_RECEPTIONIST2
	const GOLDENRODGAMECORNER1F_RECEPTIONIST3
	const GOLDENRODGAMECORNER1F_GENTLEMAN

GoldenrodGameCorner1F_MapScripts:
	def_scene_scripts

	def_callbacks
	
GoldenrodGameCorner1FCoinVendorScript:
	jumpstd GameCornerCoinVendorScript

GoldenrodGameCorner1FTMVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCorner1FPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GoldenrodGameCorner1FPrizeVendor_NoCoinCaseScript
	writetext GoldenrodGameCorner1FPrizeVendorWhichPrizeText
GoldenrodGameCorner1FTMVendor_LoopScript:
	special DisplayCoinCaseBalance
	loadmenu GoldenrodGameCorner1FTMVendorMenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Thunder
	ifequal 2, .Blizzard
	ifequal 3, .FireBlast
	sjump GoldenrodGameCorner1FPrizeVendor_CancelPurchaseScript

.Thunder:
	checkcoins GOLDENRODGAMECORNER1F_TM25_COINS
	ifequal HAVE_LESS, GoldenrodGameCorner1FPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_THUNDER
	scall GoldenrodGameCorner1FPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCorner1FPrizeVendor_CancelPurchaseScript
	giveitem TM_THUNDER
	iffalse GoldenrodGameCorner1FPrizeMonVendor_NoRoomForPrizeScript
	takecoins GOLDENRODGAMECORNER1F_TM25_COINS
	sjump GoldenrodGameCorner1FTMVendor_FinishScript

.Blizzard:
	checkcoins GOLDENRODGAMECORNER1F_TM14_COINS
	ifequal HAVE_LESS, GoldenrodGameCorner1FPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_BLIZZARD
	scall GoldenrodGameCorner1FPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCorner1FPrizeVendor_CancelPurchaseScript
	giveitem TM_BLIZZARD
	iffalse GoldenrodGameCorner1FPrizeMonVendor_NoRoomForPrizeScript
	takecoins GOLDENRODGAMECORNER1F_TM14_COINS
	sjump GoldenrodGameCorner1FTMVendor_FinishScript

.FireBlast:
	checkcoins GOLDENRODGAMECORNER1F_TM38_COINS
	ifequal HAVE_LESS, GoldenrodGameCorner1FPrizeVendor_NotEnoughCoinsScript
	getitemname STRING_BUFFER_3, TM_FIRE_BLAST
	scall GoldenrodGameCorner1FPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCorner1FPrizeVendor_CancelPurchaseScript
	giveitem TM_FIRE_BLAST
	iffalse GoldenrodGameCorner1FPrizeMonVendor_NoRoomForPrizeScript
	takecoins GOLDENRODGAMECORNER1F_TM38_COINS
	sjump GoldenrodGameCorner1FTMVendor_FinishScript

GoldenrodGameCorner1FPrizeVendor_ConfirmPurchaseScript:
	writetext GoldenrodGameCorner1FPrizeVendorConfirmPrizeText
	yesorno
	end

GoldenrodGameCorner1FTMVendor_FinishScript:
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCorner1FPrizeVendorHereYouGoText
	waitbutton
	sjump GoldenrodGameCorner1FTMVendor_LoopScript

GoldenrodGameCorner1FPrizeVendor_NotEnoughCoinsScript:
	writetext GoldenrodGameCorner1FPrizeVendorNeedMoreCoinsText
	waitbutton
	closetext
	end

GoldenrodGameCorner1FPrizeMonVendor_NoRoomForPrizeScript:
	writetext GoldenrodGameCorner1FPrizeVendorNoMoreRoomText
	waitbutton
	closetext
	end

GoldenrodGameCorner1FPrizeVendor_CancelPurchaseScript:
	writetext GoldenrodGameCorner1FPrizeVendorQuitText
	waitbutton
	closetext
	end

GoldenrodGameCorner1FPrizeVendor_NoCoinCaseScript:
	writetext GoldenrodGameCorner1FPrizeVendorNoCoinCaseText
	waitbutton
	closetext
	end

GoldenrodGameCorner1FTMVendorMenuHeader:
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

GoldenrodGameCorner1FPrizeMonVendorScript:
	faceplayer
	opentext
	writetext GoldenrodGameCorner1FPrizeVendorIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse GoldenrodGameCorner1FPrizeVendor_NoCoinCaseScript
.loop
	writetext GoldenrodGameCorner1FPrizeVendorWhichPrizeText
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Abra
	ifequal 2, .Cubone
	ifequal 3, .Wobbuffet
	sjump GoldenrodGameCorner1FPrizeVendor_CancelPurchaseScript

.Abra:
	checkcoins GOLDENRODGAMECORNER1F_ABRA_COINS
	ifequal HAVE_LESS, GoldenrodGameCorner1FPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, GoldenrodGameCorner1FPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, ABRA
	scall GoldenrodGameCorner1FPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCorner1FPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCorner1FPrizeVendorHereYouGoText
	waitbutton
	setval ABRA
	special GameCornerPrizeMonCheckDex
	givepoke ABRA, 5
	takecoins GOLDENRODGAMECORNER1F_ABRA_COINS
	sjump .loop

.Cubone:
	checkcoins GOLDENRODGAMECORNER1F_CUBONE_COINS
	ifequal HAVE_LESS, GoldenrodGameCorner1FPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, GoldenrodGameCorner1FPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, CUBONE
	scall GoldenrodGameCorner1FPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCorner1FPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCorner1FPrizeVendorHereYouGoText
	waitbutton
	setval CUBONE
	special GameCornerPrizeMonCheckDex
	givepoke CUBONE, 15
	takecoins GOLDENRODGAMECORNER1F_CUBONE_COINS
	sjump .loop

.Wobbuffet:
	checkcoins GOLDENRODGAMECORNER1F_WOBBUFFET_COINS
	ifequal HAVE_LESS, GoldenrodGameCorner1FPrizeVendor_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, GoldenrodGameCorner1FPrizeMonVendor_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, WOBBUFFET
	scall GoldenrodGameCorner1FPrizeVendor_ConfirmPurchaseScript
	iffalse GoldenrodGameCorner1FPrizeVendor_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext GoldenrodGameCorner1FPrizeVendorHereYouGoText
	waitbutton
	setval WOBBUFFET
	special GameCornerPrizeMonCheckDex
	givepoke WOBBUFFET, 15
	takecoins GOLDENRODGAMECORNER1F_WOBBUFFET_COINS
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

GoldenrodGameCorner1FDownstairsClerkScript:
	jumptextfaceplayer GoldenrodGameCorner1FDownstairsClerkText

GoldenrodGameCorner1FMrGameScript:
	jumptextfaceplayer GoldenrodGameCorner1FMrGameText
	
GoldenrodGameCorner1FVoltorbFlipMachineScript:
	refreshscreen
	special VoltorbFlip
	closetext
	end

GoldenrodGameCorner1FDirectory:
	jumptext GoldenrodGameCorner1FDirectoryText

GoldenrodGameCorner1FDownstairsClerkText:
	text "Welcome!"

	para "We have more"
	line "even more games"
	cont "downstairs."
	
	para "Please take a"
	line "look!"
	done	

GoldenrodGameCorner1FMrGameText:
	text "I'm MR.GAME!"

	para "My heart pounds"
	line "with excitement"
	cont "when I watch"
	cont "VOLTORB FLIP!"
	
	para "It's what I live"
	line "for!"
	
	para "Go ahead and play!"
	done	

GoldenrodGameCorner1FPrizeVendorIntroText:
	text "Welcome!"

	para "We exchange your"
	line "game coins for"
	cont "fabulous prizes!"
	done

GoldenrodGameCorner1FPrizeVendorWhichPrizeText:
	text "Which prize would"
	line "you like?"
	done

GoldenrodGameCorner1FPrizeVendorConfirmPrizeText:
	text_ram wStringBuffer3
	text "."
	line "Is that right?"
	done

GoldenrodGameCorner1FPrizeVendorHereYouGoText:
	text "Here you go!"
	done

GoldenrodGameCorner1FPrizeVendorNeedMoreCoinsText:
	text "Sorry! You need"
	line "more coins."
	done

GoldenrodGameCorner1FPrizeVendorNoMoreRoomText:
	text "Sorry. You can't"
	line "carry any more."
	done

GoldenrodGameCorner1FPrizeVendorQuitText:
	text "OK. Please save"
	line "your coins and"
	cont "come again!"
	done

GoldenrodGameCorner1FPrizeVendorNoCoinCaseText:
	text "Oh? You don't have"
	line "a COIN CASE."
	done

GoldenrodGameCorner1FDirectoryText:
	text "1F VOLTORB FLIP"
	
	para "B1F SLOTS"
	line "    CARD FLIP"
	done

GoldenrodGameCorner1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7, 13, GOLDENROD_CITY, 10
	warp_event  8, 13, GOLDENROD_CITY, 10
	warp_event  7,  0, GOLDENROD_GAME_CORNER_B1F, 3

	def_coord_events

	def_bg_events
	bg_event  8,  7, BGEVENT_UP,   GoldenrodGameCorner1FVoltorbFlipMachineScript
	bg_event  9,  5, BGEVENT_DOWN, GoldenrodGameCorner1FVoltorbFlipMachineScript
	bg_event  9,  7, BGEVENT_UP,   GoldenrodGameCorner1FVoltorbFlipMachineScript
	bg_event  8,  5, BGEVENT_DOWN, GoldenrodGameCorner1FVoltorbFlipMachineScript
	bg_event  6,  5, BGEVENT_DOWN, GoldenrodGameCorner1FVoltorbFlipMachineScript
	bg_event  7,  5, BGEVENT_DOWN, GoldenrodGameCorner1FVoltorbFlipMachineScript
	bg_event  6,  7, BGEVENT_UP,   GoldenrodGameCorner1FVoltorbFlipMachineScript
	bg_event  7,  7, BGEVENT_UP,   GoldenrodGameCorner1FVoltorbFlipMachineScript
	bg_event  8,  0, BGEVENT_READ, GoldenrodGameCorner1FDirectory

	def_object_events
	object_event  1,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCorner1FCoinVendorScript, -1
	object_event 15,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCorner1FTMVendorScript, -1
	object_event 12,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCorner1FPrizeMonVendorScript, -1
	object_event  6,  1, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCorner1FDownstairsClerkScript, -1
	object_event  7,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodGameCorner1FMrGameScript, -1
