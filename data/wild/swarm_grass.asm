; Pokémon swarms in grass

SwarmGrassWildMons:

; Yanma swarm					
	def_grass_wildmons ROUTE_35				
	db 10 percent,	10 percent,	10 percent ; encounter rates: morn/day/nite		
	; morn
	;   %, species,    min, max
	db 30,	NIDORAN_M,	12, 12		
	db 30,	NIDORAN_F,	12, 12		
	db 20,	YANMA,		12, 14		
	db 10,	YANMA,		12, 14		
	db  5,	PIDGEY,		14, 14		
	db  4,	DITTO,		10, 10		
	db  1,	DITTO,		10, 10		
	
	; day				
	;   %, species,    min, max
	db 12,	NIDORAN_M,	12, 12		
	db 12,	NIDORAN_F,	12, 12		
	db 12,	YANMA,		12, 14		
	db 14,	YANMA,		12, 14		
	db 14,	PIDGEY,		14, 14		
	db 10,	DITTO,		10, 10		
	db 10,	DITTO,		10, 10	
	
	; nite				
	;   %, species,    min, max
	db 12,	NIDORAN_M,	12, 12		
	db 12,	NIDORAN_F,	12, 12		
	db 12,	YANMA,		12, 14		
	db 14,	YANMA,		12, 14		
	db 14,	HOOTHOOT,	14, 14		
	db 10,	DITTO,		10, 10		
	db 10,	DITTO,		10, 10		
	end_grass_wildmons				

; Snubbull swarm
	def_grass_wildmons ROUTE_38
	db 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite
	; morn
	;   %, species,    min, max
	db 30,	SNUBBULL,	16, 16
	db 30,	RATICATE,	16, 16
	db 20,	MAGNEMITE,	16, 16
	db 10,	PIDGEOTTO,	16, 16
	db  5,	TAUROS,		13, 13
	db  4,	MILTANK,	13, 13
	db  1,	MILTANK,	13, 13
	
	; day	
	;   %, species,    min, max	
	db 30,	SNUBBULL,	16, 16
	db 30,	RATICATE,	16, 16
	db 20,	MAGNEMITE,	16, 16
	db 10,	PIDGEOTTO,	16, 16
	db  5,	TAUROS,		13, 13
	db  4,	MILTANK,	13, 13
	db  1,	MILTANK,	13, 13
	
	; nite		
	;   %, species,    min, max
	db 30,	SNUBBULL,	16, 16
	db 30,	MEOWTH,		16, 16
	db 20,	RATICATE,	16, 16
	db 10,	MAGNEMITE,	16, 16
	db  5,	NOCTOWL,	16, 16
	db  4,	MEOWTH,		16, 16
	db  1,	MEOWTH,		16, 16
	end_grass_wildmons

; Dunsparce swarm
	def_grass_wildmons DARK_CAVE_VIOLET_ENTRANCE
	db 4 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite
	; morn
	;   %, species,    min, max
	db 30,	GEODUDE,	 3, 3
	db 30,	DUNSPARCE,	 3, 3
	db 20,	ZUBAT,		 2, 2
	db 10,	GEODUDE,	 2, 2
	db  5,	DUNSPARCE,	 2, 2
	db  4,	DUNSPARCE,	 4, 4
	db  1,	TEDDIURSA,	 4, 4
	
	; day
	;   %, species,    min, max
	db 30,	GEODUDE,	 3, 3
	db 30,	DUNSPARCE,	 3, 3
	db 20,	ZUBAT,		 2, 2
	db 10,	GEODUDE,	 2, 2
	db  5,	DUNSPARCE,	 2, 2
	db  4,	DUNSPARCE,	 4, 4
	db  1,	DUNSPARCE,	 4, 4
	
	; nite		
	;   %, species,    min, max
	db 30,	GEODUDE,	 3, 3
	db 30,	DUNSPARCE,	 3, 3
	db 20,	ZUBAT,		 2, 2
	db 10,	GEODUDE,	 2, 2
	db  5,	DUNSPARCE,	 2, 2
	db  4,	DUNSPARCE,	 4, 4
	db  1,	DUNSPARCE,	 4, 4
	end_grass_wildmons

; Marill swarm
	def_grass_wildmons MOUNT_MORTAR_1F_OUTSIDE
	db 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite
	; morn
	;   %, species,    min, max
	db 30,	MARILL,		13, 13
	db 30,	ZUBAT,		15, 15
	db 20,	MACHOP,		14, 14
	db 10,	MARILL,		15, 15
	db  5,	GEODUDE,	14, 14
	db  4,	RATTATA,	16, 16
	db  1,	RATTATA,	16, 16
	
	; day		
	;   %, species,    min, max
	db 30,	MARILL,		13, 13
	db 30,	ZUBAT,		15, 15
	db 20,	MACHOP,		14, 14
	db 10,	MARILL,		15, 15
	db  5,	GEODUDE,	14, 14
	db  4,	RATTATA,	16, 16
	db  1,	RATTATA,	16, 16
	
	; nite		
	;   %, species,    min, max
	db 30,	MARILL,		13, 13
	db 30,	ZUBAT,		15, 15
	db 20,	MACHOP,		14, 14
	db 10,	MARILL,		15, 15
	db  5,	GEODUDE,	14, 14
	db  4,	RATTATA,	16, 16
	db  1,	RATTATA,	16, 16
	end_grass_wildmons		

	db -1 ; end
