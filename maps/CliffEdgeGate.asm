	object_const_def
	const CLIFFEDGEGATE_POKEFAN_F

CliffEdgeGate_MapScripts:
	def_scene_scripts

	def_callbacks

CliffEdgeGateSign:
	jumptext CliffEdgeGateSignText

CliffEdgeGatePokefanFScript:
	jumptextfaceplayer CliffEdgeGatePokefanFText

CliffEdgeGatePokefanFText:
	text "Come back later."
	done

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
	warp_event 17, 27, CIANWOOD_CITY, 8
	warp_event  5,  8, ROUTE_47, 1

	def_coord_events

	def_bg_events
	bg_event 18, 25, BGEVENT_READ, CliffEdgeGateSign

	def_object_events
	object_event  19, 22, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CliffEdgeGatePokefanFScript, -1
