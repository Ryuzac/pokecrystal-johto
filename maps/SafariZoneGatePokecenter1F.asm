	object_const_def
	const SafariZoneGatePOKECENTER1F_NURSE
	const SafariZoneGatePOKECENTER1F_GENTLEMAN
	const SafariZoneGatePOKECENTER1F_POKEFAN_F

SafariZoneGatePokecenter1F_MapScripts:
	def_scene_scripts
	scene_script SafariZoneGatePokecenter1FNoopScene ; unusable

	def_callbacks

SafariZoneGatePokecenter1FNoopScene:
	end

SafariZoneGatePokecenter1FNurseScript:
	jumpstd PokecenterNurseScript

SafariZoneGatePokecenter1FLassScript:
	jumptextfaceplayer SafariZoneGatePokecenter1FLassText

SafariZoneGatePokecenter1FPokefanMScript:
	jumptextfaceplayer SafariZoneGatePokecenter1FPokefanMText

SafariZoneGatePokecenter1FLassText:
	text "Those who come to"
	line "a #MON CENTER"
	cont "often take care"
	cont "of their #MON."

	para "Wouldn't you"
	line "agree?"
	done

SafariZoneGatePokecenter1FPokefanMText:
	text "After a long walk"
	line "in the mountains"
	cont "to find a #MON"
	cont "CENTER, when"
	cont "you're just about"
	cont "to fall over…"

	para "Then it feels"
	line "like paradise!"
	done

SafariZoneGatePokecenter1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, SAFARI_ZONE_GATE, 1
	warp_event  4,  7, SAFARI_ZONE_GATE, 1
	warp_event  0,  7, POKECENTER_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  1, SPRITE_NURSE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneGatePokecenter1FNurseScript, -1
	object_event  6,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneGatePokecenter1FPokefanMScript, -1
	object_event  1,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SafariZoneGatePokecenter1FLassScript, -1
