	object_const_def
	const GOLDERNRODPORTGATE_OFFICER

GoldenrodPortGate_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodPortGateOfficerScript:
	jumptextfaceplayer GoldenrodPortGateOfficerText

GoldenrodPortGateOfficerText:
	text "ZZZ……"
	done

GoldenrodPortGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ROUTE_41, 1
	warp_event  0,  5, ROUTE_41, 2
	warp_event  9,  4, GOLDENROD_CITY, 16
	warp_event  9,  5, GOLDENROD_CITY, 17

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodPortGateOfficerScript, -1
