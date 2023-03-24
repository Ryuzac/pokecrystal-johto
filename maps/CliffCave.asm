	object_const_def

CliffCave_MapScripts:
	def_scene_scripts

	def_callbacks

CliffCave_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 29, 21, ROUTE_47,   3
	warp_event 29, 19, CLIFF_CAVE, 4
	warp_event  5, 5,  CLIFF_CAVE, 6
	warp_event  3, 11, CLIFF_CAVE, 2
	warp_event  5, 19, CLIFF_CAVE, 8
	warp_event 17, 13, CLIFF_CAVE, 3
	warp_event 15, 21, ROUTE_47,   2
	warp_event 25,  3, CLIFF_CAVE, 5
	warp_event 29,  9, ROUTE_47,   4

	def_coord_events

	def_bg_events

	def_object_events
