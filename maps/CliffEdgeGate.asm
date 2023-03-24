	object_const_def

CliffEdgeGate_MapScripts:
	def_scene_scripts

	def_callbacks

CliffEdgeGateSign:
	jumptext CliffEdgeGateSignText
	
CliffEdgeGateSignText:
	text "Everything is"
	line "thrilling!"

	para "Explore to find"
	line "wild #MON!"
	
	para "WARDEN BAOBA'S"
	line "SAFARI ZONE"
	cont "up and running!"
	done

CliffEdgeGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 17, 25, CIANWOOD_CITY, 8
	warp_event 15,  5, ROUTE_47, 1

	def_coord_events

	def_bg_events
	bg_event 18, 23, BGEVENT_READ, CliffEdgeGateSign

	def_object_events
