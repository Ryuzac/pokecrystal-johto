	object_const_def
	const CIANWOODPHARMACY_PHARMACIST
	const CIANWOODPHARMACY_APPRENTICE

CianwoodPharmacy_MapScripts:
	def_scene_scripts
	scene_script CianwoodPharmacyNoopScene ; unusable

	def_callbacks

CianwoodPharmacyNoopScene:
	end

CianwoodPharmacist:
	faceplayer
	opentext
	checkevent EVENT_GOT_SECRETPOTION_FROM_PHARMACY
	iftrue .Mart
	checkevent EVENT_JASMINE_EXPLAINED_AMPHYS_SICKNESS
	iffalse .Mart
	writetext PharmacistGiveSecretpotionText
	promptbutton
	giveitem SECRETPOTION
	writetext ReceivedSecretpotionText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_SECRETPOTION_FROM_PHARMACY
	writetext PharmacistDescribeSecretpotionText
	waitbutton
	closetext
	end

.Mart:
	pokemart MARTTYPE_PHARMACY, MART_CIANWOOD
	closetext
	end

CianwoodPharmacyRadio:
	jumpstd Radio2Script
	
CianwoodPharmacyBookshelf:
	jumpstd DifficultBookshelfScript

CianwoodPharmacyShelfScript:
	jumptext CianwoodPharmacyShelfText
	
CianwoodPharmacyDrawerScript:
	jumptext CianwoodPharmacyDrawerText

CianwoodPharmacyApprentice:
	jumptextfaceplayer CianwoodPharmacyApprenticeText

PharmacistGiveSecretpotionText:
	text "Your #MON ap-"
	line "pear to be fine."

	para "Is something wor- "
	line "rying you?"

	para "…"

	para "The LIGHTHOUSE"
	line "#MON is in"
	cont "trouble?"

	para "I got it!"

	para "This ought to do"
	line "the trick."
	done

ReceivedSecretpotionText:
	text "<PLAYER> received"
	line "SECRETPOTION."
	done
	
PharmacistDescribeSecretpotionText:
	text "My SECRETPOTION is"
	line "a tad too strong."

	para "I only offer it in"
	line "an emergency."
	done

CianwoodPharmacyApprenticeText:
	text "I'm training to"
	line "make medicine for"
	cont "#MON."
	done

CianwoodPharmacyShelfText:
	text "It's full of"
	line "complicated"
	cont "looking tools."
	done

CianwoodPharmacyDrawerText:
	text "The drawers are"
	line "full of plants"
	cont "and odd powders."
	done

CianwoodPharmacy_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, CIANWOOD_CITY, 4
	warp_event  4,  7, CIANWOOD_CITY, 4

	def_coord_events

	def_bg_events
	bg_event  1,  1, BGEVENT_READ, CianwoodPharmacyBookshelf
	bg_event  6,  1, BGEVENT_READ, CianwoodPharmacyShelfScript
	bg_event  2,  1, BGEVENT_READ, CianwoodPharmacyRadio
	bg_event  7,  1, BGEVENT_READ, CianwoodPharmacyDrawerScript

	def_object_events
	object_event  2,  3, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CianwoodPharmacist, -1
	object_event  5,  4, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CianwoodPharmacyApprentice, -1
