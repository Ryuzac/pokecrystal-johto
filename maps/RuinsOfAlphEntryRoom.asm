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
	warp_event  3,  7, RUINS_OF_ALPH_OUTSIDE, 5
	warp_event  4,  7, RUINS_OF_ALPH_OUTSIDE, 5
	warp_event  4,  3, RUINS_OF_ALPH_INNER_CHAMBER, 1

	def_coord_events

	def_bg_events
	bg_event  1,  1, BGEVENT_READ, RuinsOfAlphEntryRoomStatue
	bg_event  6,  1, BGEVENT_READ, RuinsOfAlphEntryRoomStatue
	bg_event  1,  5, BGEVENT_READ, RuinsOfAlphEntryRoomStatue
	bg_event  6,  5, BGEVENT_READ, RuinsOfAlphEntryRoomStatue

	def_object_events
