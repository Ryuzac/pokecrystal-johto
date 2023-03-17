	object_const_def

Route41_MapScripts:
	def_scene_scripts

	def_callbacks

Route41Sign:
	jumptext Route41SignText

Route41SignText:
	text "ROUTE 41"

	para "CIANWOOD CITY -"
	line "GOLDENROD CITY"
	done
	
Route41_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  47,  18, GOLDENROD_PORT_GATE, 1
	warp_event  47,  19, GOLDENROD_PORT_GATE, 2

	def_coord_events

	def_bg_events
	bg_event 41, 17, BGEVENT_READ, Route41Sign

	def_object_events

