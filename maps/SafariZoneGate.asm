	object_const_def
	const SAFARIZONEGATE_BEAUTY
	const SAFARIZONEGATE_SLOWPOKE
	const SAFARIZONEGATE_GRAMPS
	const SAFARIZONEGATE_TEACHER
	const SAFARIZONEGATE_BUTTERFREE
	const SAFARIZONEGATE_COOLTRAINER_M
	const SAFARIZONEGATE_BUG_CATCHER
	const SAFARIZONEGATE_GENTLEMAN
	const SAFARIZONEGATE_JIGGLYPUFF
	const SAFARIZONEGATE_POKEFAN_F
	const SAFARIZONEGATE_KANGASKHAN
	const SAFARIZONEGATE_TWIN
	const SAFARIZONEGATE_OFFICER1
	const SAFARIZONEGATE_OFFICER2

SafariZoneGate_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, .Flypoint

.Flypoint:
	setflag ENGINE_FLYPOINT_SAFARI_ZONE_GATE
	return

SafariZoneGatePokecenterSign:
	jumpstd PokecenterSignScript

SafariZoneGateSafariZoneSign:
	jumptext SafariZoneGateSafariZoneSignText

SafariZoneGateBeautyScript:
	jumptextfaceplayer SafariZoneGateBeautyText
	
SafariZoneGateSlowpokeScript:
	opentext
	writetext SafariZoneGateSlowpokeText1
	pause 60
	writetext SafariZoneGateSlowpokeText2
	cry SLOWPOKE
	waitbutton
	closetext
	end
	
SafariZoneGateGrampsScript:
	jumptextfaceplayer SafariZoneGateGrampsText
	
SafariZoneGateTeacherScript:
	jumptextfaceplayer SafariZoneGateTeacherText
	
SafariZoneGateButterfreeScript:
	jumptextfaceplayer SafariZoneGateButterfreeText
	
SafariZoneGateCooltrainerMScript:
	jumptextfaceplayer SafariZoneGateCooltrainerMText
	
SafariZoneGateBugCatcherScript:
	jumptextfaceplayer SafariZoneGateBugCatcherText
	
SafariZoneGateGentlemanScript:
	jumptextfaceplayer SafariZoneGateGentlemanText
	
SafariZoneGateJigglypuffScript:
	jumptextfaceplayer SafariZoneGateJigglypuffText
	
SafariZoneGatePokefanFScript:
	jumptextfaceplayer SafariZoneGatePokefanFText
	
SafariZoneGateKangaskhanScript:
	jumptextfaceplayer SafariZoneGateKangaskhanText
	
SafariZoneGateTwinScript:
	jumptextfaceplayer SafariZoneGateTwinText
	
SafariZoneGateOfficer1Script:
	jumptextfaceplayer SafariZoneGateOfficer1Text
	
SafariZoneGateOfficer2Script:
	jumptextfaceplayer SafariZoneGateOfficer2Text

SafariZoneGateSafariZoneSignText:
	text "SAFARI ZONE"

	para "Experience the"
	line "thrilling wild!"
	done

SafariZoneGateBeautyText:
	text "No #MON is"
	line "cuter than"
	cont "SLOWPOKE."
	
	para "People say I look"
	line "like one!"
	done

SafariZoneGateSlowpokeText1:
	text "SLOWPOKE: …"

	para "<……> <……> <……>"
	done

SafariZoneGateSlowpokeText2:
	text "<……> <……>Yawn?"
	done

SafariZoneGateGrampsText:
	text "I've decided to"
	line "carry #MON"
	cont "drinks."
	
	para "I'm new to it, but"
	line "I'll do my best…"
	
	para "Welcome! How may I"
	line "help you?"
	done

SafariZoneGateTeacherText:
	text "Oh, you want to"
	line "buy something?"
	
	para "Can you wait while"
	line "I get it ready?"
	
	para "Just a minute…"
	
	para "………………"
	
	para "Welcome! How may I"
	line "help you?"
	done
	
SafariZoneGateButterfreeText:
	text "BUTTERFREE: Freeh!"
	done

SafariZoneGateCooltrainerMText:
	text "SAFARI ZONE…"
	
	para "It makes me feel"
	line "like I'm in a"
	cont "foreign country."
	
	para "It's a strange"
	line "feeling."
	done

SafariZoneGateBugCatcherText:
	text "SAFARI, SAFARI,"
	line "it is so much fun."
	
	para "SAFARI, SAFARI,"
	line "so interesting,"
	cont "huh!"
	
	para "So many #MON"
	line "waiting for us!"
	
	para "That's a song I"
	line "sing in the"
	cont "SAFARI ZONE."
	done

SafariZoneGateGentlemanText:
	text "This SAFARI ZONE"
	line "is great!"
	
	para "I kept going after"
	line "#MON!"
	
	para "That made my"
	line "JIGGLYPUFF upset"
	cont "though."
	done
	
SafariZoneGateJigglypuffText:
	text "JIGGLYPUFF: Puu"
	line "pupuu."
	done

SafariZoneGatePokefanFText:
	text "………………"
	
	para "(I am not a"
	line "a talker.)"
	done

SafariZoneGateKangaskhanText:
	text "KANGASKHAN:"
	line "………………"
	done

SafariZoneGateTwinText:
	text "I want to catch my"
	line "first #MON at"
	cont "the SAFARI ZONE."
	done

SafariZoneGateOfficer1Text:
	text "You might think"
	line "that there is an"
	cont "automatic system"
	cont "to change the"
	cont "SAFARI ZONE,"
	cont "right?"
	
	para "The truth is…"
	done

SafariZoneGateOfficer2Text:
	text "Argh…"
	line "I am so exhausted…"
	
	para "This job uses so"
	line "much of your"
	cont "energy…"
	done

SafariZoneGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 5,  9, SAFARI_ZONE_GATE_POKECENTER_1F, 1
	
	def_coord_events

	def_bg_events
	bg_event  6,  9, BGEVENT_READ, SafariZoneGatePokecenterSign
	bg_event 14,  4, BGEVENT_READ, SafariZoneGateSafariZoneSign
	
	def_object_events
	object_event 20, 17, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SafariZoneGateBeautyScript, -1
	object_event 21, 17, SPRITE_SLOWPOKE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneGateSlowpokeScript, -1
	object_event 18, 15, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneGateGrampsScript, -1
	object_event  7, 15, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariZoneGateTeacherScript, -1
	object_event  6, 15, SPRITE_BUTTERFREE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneGateButterfreeScript, -1
	object_event 10, 16, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SafariZoneGateCooltrainerMScript, -1
	object_event 18, 11, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariZoneGateBugCatcherScript, -1
	object_event  4,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SafariZoneGateGentlemanScript, -1
	object_event  3,  4, SPRITE_JIGGLYPUFF, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneGateJigglypuffScript, -1
	object_event 18,  7, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariZoneGatePokefanFScript, -1
	object_event 19,  7, SPRITE_MONSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, SafariZoneGateKangaskhanScript, -1
	object_event  9, 10, SPRITE_TWIN, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SafariZoneGateTwinScript, -1
	object_event 17,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariZoneGateOfficer1Script, -1
	object_event 18,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, SafariZoneGateOfficer2Script, -1
