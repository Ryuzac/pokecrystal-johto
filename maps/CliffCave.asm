	object_const_def
	const CLIFFCAVE_PHARMACIST
	
CliffCave_MapScripts:
	def_scene_scripts

	def_callbacks

CliffCavePharmacistScript:
	jumptextfaceplayer CliffCavePharmacistText

CliffCavePharmacistText:
	text "Usually a fork in"
	line "a cave has a right"
	cont "and wrong way."
	
	para "But people can't"
	line "help trying both."
	
	para "Do you want to go"
	line "up or down?"
	done

CliffCave_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 29, 21, ROUTE_47,   3
	warp_event 29, 19, CLIFF_CAVE, 4
	warp_event  5, 5,  CLIFF_CAVE, 6
	warp_event  3, 13, CLIFF_CAVE, 2
	warp_event  5, 19, CLIFF_CAVE, 8
	warp_event 17, 13, CLIFF_CAVE, 3
	warp_event 15, 21, ROUTE_47,   2
	warp_event 25,  3, CLIFF_CAVE, 5
	warp_event 29,  9, ROUTE_47,   4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3, 11, SPRITE_PHARMACIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CliffCavePharmacistScript, -1
