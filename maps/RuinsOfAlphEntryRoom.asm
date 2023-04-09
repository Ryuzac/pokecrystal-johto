	object_const_def

RuinsOfAlphEntryRoom_MapScripts:
	def_scene_scripts

	def_callbacks

RuinsOfAlphEntryRoomStatue:
	jumptext RuinsOfAlphEntryRoomStatueText
	
RuinsOfAlphEntryRoomStatueText:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

RuinsOfAlphEntryRoom_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 5
	warp_event  5,  9, RUINS_OF_ALPH_OUTSIDE, 5
	warp_event  4,  5, RUINS_OF_ALPH_INNER_CHAMBER, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_READ, RuinsOfAlphEntryRoomStatue
	bg_event  7,  3, BGEVENT_READ, RuinsOfAlphEntryRoomStatue
	bg_event  2,  7, BGEVENT_READ, RuinsOfAlphEntryRoomStatue
	bg_event  7,  7, BGEVENT_READ, RuinsOfAlphEntryRoomStatue

	def_object_events
