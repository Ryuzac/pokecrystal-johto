; Pokémon swarms in water

SwarmWaterWildMons:

; Marill swarm
	def_water_wildmons MOUNT_MORTAR_1F_OUTSIDE
	db 4 percent ; encounter rate
	;   %, species,    min, max
	db 65, GOLDEEN,		15, 19
	db 20, MARILL,		20, 24
	db 10, MARILL,      20, 24
	db  5, SEAKING,		20, 24
	end_water_wildmons
	
	db -1 ; end
