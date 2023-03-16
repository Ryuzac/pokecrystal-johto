; code from Polished/Rangi's tutorial, palettes by Major Agnostic
MACRO menu_mon_pals
	dn PAL_MON_\1, PAL_MON_\2
ENDM

FollowingPalLookupTable::
; Entries map party_menu pals to OW pals.
	db PAL_OW_RED    ; PAL_MON_RED
	db PAL_OW_BLUE   ; PAL_MON_BLUE
	db PAL_OW_GREEN  ; PAL_MON_GREEN
	db PAL_OW_BROWN  ; PAL_MON_BROWN
	db PAL_OW_RED    ; PAL_MON_PINK
	db PAL_OW_BROWN  ; PAL_MON_GRAY
	db PAL_OW_BLUE   ; PAL_MON_TEAL
	db PAL_OW_PURPLE ; PAL_MON_PURPLE

MenuMonPals::
	table_width 1, MenuMonPals
	;             normal, shiny
	menu_mon_pals TEAL,   GREEN  ; BULBASAUR
	menu_mon_pals TEAL,   GREEN  ; IVYSAUR
	menu_mon_pals TEAL,   GREEN  ; VENUSAUR
	menu_mon_pals RED,    BROWN  ; CHARMANDER
	menu_mon_pals RED,    BROWN  ; CHARMELEON
	menu_mon_pals RED,    PURPLE ; CHARIZARD
	menu_mon_pals BLUE,   TEAL   ; SQUIRTLE
	menu_mon_pals BLUE,   TEAL   ; WARTORTLE
	menu_mon_pals BLUE,   TEAL   ; BLASTOISE
	menu_mon_pals GREEN,  BROWN  ; CATERPIE
	menu_mon_pals GREEN,  BROWN  ; METAPOD
	menu_mon_pals TEAL,   PINK   ; BUTTERFREE
	menu_mon_pals RED,    GREEN  ; WEEDLE
	menu_mon_pals BROWN,  GREEN  ; KAKUNA
	menu_mon_pals RED,    BLUE   ; BEEDRILL
	menu_mon_pals BROWN,  RED    ; PIDGEY
	menu_mon_pals BROWN,  BROWN  ; PIDGEOTTO
	menu_mon_pals BROWN,  GREEN  ; PIDGEOT
	menu_mon_pals PURPLE, GRAY   ; RATTATA
	menu_mon_pals BROWN,  BROWN  ; RATICATE
	menu_mon_pals BROWN,  BROWN  ; SPEAROW
	menu_mon_pals BROWN,  GRAY   ; FEAROW
	menu_mon_pals PURPLE, GREEN  ; EKANS
	menu_mon_pals PURPLE, GREEN  ; ARBOK
	menu_mon_pals RED,    RED    ; PIKACHU
	menu_mon_pals RED,    BROWN  ; RAICHU
	menu_mon_pals BROWN,  GRAY   ; SANDSHREW
	menu_mon_pals BROWN,  GRAY   ; SANDSLASH
	menu_mon_pals BLUE,   PURPLE ; NIDORAN_F
	menu_mon_pals BLUE,   PURPLE ; NIDORINA
	menu_mon_pals BLUE,   GRAY   ; NIDOQUEEN
	menu_mon_pals PURPLE, BLUE   ; NIDORAN_M
	menu_mon_pals PURPLE, BLUE   ; NIDORINO
	menu_mon_pals PURPLE, BLUE   ; NIDOKING
	menu_mon_pals BROWN,  GREEN  ; CLEFAIRY
	menu_mon_pals BROWN,  GREEN  ; CLEFABLE
	menu_mon_pals RED,    BROWN  ; VULPIX
	menu_mon_pals BROWN,  GRAY   ; NINETALES
	menu_mon_pals RED,    PINK   ; JIGGLYPUFF
	menu_mon_pals RED,    PINK   ; WIGGLYTUFF
	menu_mon_pals BLUE,   GREEN  ; ZUBAT
	menu_mon_pals BLUE,   PINK   ; GOLBAT
	menu_mon_pals GREEN,  BROWN  ; ODDISH
	menu_mon_pals RED,    BROWN  ; GLOOM
	menu_mon_pals RED,    PINK   ; VILEPLUME
	menu_mon_pals RED,    BROWN  ; PARAS
	menu_mon_pals RED,    BROWN  ; PARASECT
	menu_mon_pals RED,    BLUE   ; VENONAT
	menu_mon_pals PURPLE, BLUE   ; VENOMOTH
	menu_mon_pals BROWN,  BLUE   ; DIGLETT
	menu_mon_pals BROWN,  BLUE   ; DUGTRIO
	menu_mon_pals BROWN,  PURPLE ; PERSIAN
	menu_mon_pals BROWN,  PURPLE ; MEOWTH
	menu_mon_pals BROWN,  BLUE   ; PSYDUCK
	menu_mon_pals BLUE,   BLUE   ; GOLDUCK
	menu_mon_pals BROWN,  GREEN  ; MANKEY
	menu_mon_pals BROWN,  BROWN  ; PRIMEAPE
	menu_mon_pals RED,    BROWN  ; GROWLITHE
	menu_mon_pals RED,    BROWN  ; ARCANINE
	menu_mon_pals BLUE,   TEAL   ; POLIWAG
	menu_mon_pals BLUE,   TEAL   ; POLIWHIRL
	menu_mon_pals BLUE,   TEAL   ; POLIWRATH
	menu_mon_pals BROWN,  PURPLE ; ABRA
	menu_mon_pals BROWN,  PURPLE ; KADABRA
	menu_mon_pals BROWN,  PURPLE ; ALAKAZAM
	menu_mon_pals BROWN,  GRAY   ; MACHOP
	menu_mon_pals GRAY,   GRAY   ; MACHOKE
	menu_mon_pals BROWN,  GRAY   ; MACHAMP
	menu_mon_pals GREEN,  BROWN  ; BELLSPROUT
	menu_mon_pals GREEN,  PURPLE ; WEEPINBELL
	menu_mon_pals GREEN,  GREEN  ; VICTREEBEL
	menu_mon_pals BLUE,   BLUE   ; TENTACOOL
	menu_mon_pals BLUE,   BLUE   ; TENTACRUEL
	menu_mon_pals GRAY,   BROWN  ; GEODUDE
	menu_mon_pals GRAY,   BROWN  ; GRAVELER
	menu_mon_pals GRAY,   BROWN  ; GOLEM
	menu_mon_pals RED,    BROWN  ; PONYTA
	menu_mon_pals RED,    PURPLE ; RAPIDASH
	menu_mon_pals PINK,   PURPLE ; SLOWPOKE
	menu_mon_pals PINK,   PURPLE ; SLOWBRO
	menu_mon_pals GRAY,   GRAY   ; MAGNEMITE
	menu_mon_pals GRAY,   GRAY   ; MAGNETON
	menu_mon_pals BROWN,  BROWN  ; FARFETCH_D
	menu_mon_pals BROWN,  BROWN  ; DODUO
	menu_mon_pals BROWN,  BROWN  ; DODRIO
	menu_mon_pals BLUE,   GRAY   ; SEEL
	menu_mon_pals BLUE,   GRAY   ; DEWGONG
	menu_mon_pals PURPLE, GRAY   ; GRIMER
	menu_mon_pals PURPLE, GREEN  ; MUK
	menu_mon_pals PURPLE, BROWN  ; SHELLDER
	menu_mon_pals PURPLE, BLUE   ; CLOYSTER
	menu_mon_pals PURPLE, BLUE   ; GASTLY
	menu_mon_pals RED,    BLUE   ; HAUNTER
	menu_mon_pals RED,    PURPLE ; GENGAR
	menu_mon_pals GRAY,   GREEN  ; ONIX
	menu_mon_pals BROWN,  PURPLE ; DROWZEE
	menu_mon_pals BROWN,  PURPLE ; HYPNO
	menu_mon_pals RED,    BROWN  ; KRABBY
	menu_mon_pals RED,    GRAY   ; KINGLER
	menu_mon_pals RED,    BLUE   ; VOLTORB
	menu_mon_pals RED,    BLUE   ; ELECTRODE
	menu_mon_pals PINK,   GREEN  ; EXEGGCUTE
	menu_mon_pals GREEN,  BROWN  ; EXEGGUTOR
	menu_mon_pals BROWN,  GRAY   ; CUBONE
	menu_mon_pals BROWN,  GRAY   ; MAROWAK
	menu_mon_pals BROWN,  GREEN  ; HITMONLEE
	menu_mon_pals BROWN,  GRAY   ; HITMONCHAN
	menu_mon_pals RED,    PINK   ; LICKITUNG
	menu_mon_pals PURPLE, BLUE   ; KOFFING
	menu_mon_pals PURPLE, BLUE   ; WEEZING
	menu_mon_pals GRAY,   BROWN  ; RHYHORN
	menu_mon_pals GRAY,   GRAY   ; RHYDON
	menu_mon_pals PINK,   GREEN  ; CHANSEY
	menu_mon_pals BLUE,   GREEN  ; TANGELA
	menu_mon_pals BROWN,  GRAY   ; KANGASKHAN
	menu_mon_pals BLUE,   BLUE   ; HORSEA
	menu_mon_pals BLUE,   BLUE   ; SEADRA
	menu_mon_pals PINK,   BROWN  ; GOLDEEN
	menu_mon_pals RED,    BROWN  ; SEAKING
	menu_mon_pals BROWN,  BLUE   ; STARYU
	menu_mon_pals PURPLE, BLUE   ; STARMIE
	menu_mon_pals PINK,   GREEN  ; MR__MIME
	menu_mon_pals GREEN,  GREEN  ; SCYTHER
	menu_mon_pals PURPLE, PURPLE ; JYNX
	menu_mon_pals BROWN,  GRAY   ; ELECTABUZZ
	menu_mon_pals RED,    PURPLE ; MAGMAR
	menu_mon_pals BROWN,  GRAY   ; PINSIR
	menu_mon_pals BROWN,  BROWN  ; TAUROS
	menu_mon_pals RED,    BROWN  ; MAGIKARP
	menu_mon_pals BLUE,   RED    ; GYARADOS
	menu_mon_pals BLUE,   PURPLE ; LAPRAS
	menu_mon_pals PURPLE, BLUE   ; DITTO
	menu_mon_pals BROWN,  GRAY   ; EEVEE
	menu_mon_pals BLUE,   PURPLE ; VAPOREON
	menu_mon_pals RED,    BROWN  ; JOLTEON
	menu_mon_pals RED,    RED    ; FLAREON
	menu_mon_pals TEAL,   BLUE   ; PORYGON
	menu_mon_pals BLUE,   GRAY   ; OMANYTE
	menu_mon_pals BLUE,   GRAY   ; OMASTAR
	menu_mon_pals BROWN,  GRAY   ; KABUTO
	menu_mon_pals BROWN,  GRAY   ; KABUTOPS
	menu_mon_pals GRAY,   PURPLE ; AERODACTYL
	menu_mon_pals BROWN,  BLUE   ; SNORLAX
	menu_mon_pals BLUE,   BLUE   ; ARTICUNO
	menu_mon_pals BROWN,  RED    ; ZAPDOS
	menu_mon_pals RED,    RED    ; MOLTRES
	menu_mon_pals BLUE,   PURPLE ; DRATINI
	menu_mon_pals BLUE,   PURPLE ; DRAGONAIR
	menu_mon_pals RED,    GRAY   ; DRAGONITE
	menu_mon_pals PURPLE, BROWN  ; MEWTWO
	menu_mon_pals PINK,   BLUE   ; MEW
	menu_mon_pals GREEN,  BROWN  ; CHIKORITA
	menu_mon_pals GREEN,  BROWN  ; BAYLEEF
	menu_mon_pals GREEN,  GREEN  ; MEGANIUM
	menu_mon_pals PINK,   PURPLE ; CYNDAQUIL
	menu_mon_pals PINK,   PURPLE ; QUILAVA
	menu_mon_pals PINK,   PURPLE ; TYPHLOSION
	menu_mon_pals BLUE,   TEAL   ; TOTODILE
	menu_mon_pals BLUE,   TEAL   ; CROCONAW
	menu_mon_pals BLUE,   TEAL   ; FERALIGATR
	menu_mon_pals BROWN,  PURPLE ; SENTRET
	menu_mon_pals BROWN,  PURPLE ; FURRET
	menu_mon_pals BROWN,  BROWN  ; HOOTHOOT
	menu_mon_pals BROWN,  GREEN  ; NOCTOWL
	menu_mon_pals RED,    PINK   ; LEDYBA
	menu_mon_pals RED,    PINK   ; LEDIAN
	menu_mon_pals GREEN,  PURPLE ; SPINARAK
	menu_mon_pals RED,    PURPLE ; ARIADOS
	menu_mon_pals PURPLE, PINK   ; CROBAT
	menu_mon_pals BLUE,   GRAY   ; CHINCHOU
	menu_mon_pals BLUE,   BLUE   ; LANTURN
	menu_mon_pals RED,    BROWN  ; PICHU
	menu_mon_pals PINK,   GREEN  ; CLEFFA
	menu_mon_pals PINK,   GREEN  ; IGGLYBUFF
	menu_mon_pals RED,    BLUE   ; TOGEPI
	menu_mon_pals RED,    BLUE   ; TOGETIC
	menu_mon_pals TEAL,   TEAL   ; NATU
	menu_mon_pals TEAL,   GREEN  ; XATU
	menu_mon_pals BLUE,   PURPLE ; MAREEP
	menu_mon_pals PINK,   PINK   ; FLAAFFY
	menu_mon_pals BROWN,  BLUE   ; AMPHAROS
	menu_mon_pals RED,    PINK   ; BELLOSSOM
	menu_mon_pals BLUE,   GREEN  ; MARILL
	menu_mon_pals BLUE,   BROWN  ; AZUMARILL
	menu_mon_pals GREEN,  RED    ; SUDOWOODO
	menu_mon_pals GREEN,  GRAY   ; POLITOED
	menu_mon_pals RED,    GREEN  ; HOPPIP
	menu_mon_pals GREEN,  PURPLE ; SKIPLOOM
	menu_mon_pals BLUE,   PURPLE ; JUMPLUFF
	menu_mon_pals PURPLE, PURPLE ; AIPOM
	menu_mon_pals GREEN,  GREEN  ; SUNKERN
	menu_mon_pals GREEN,  BROWN  ; SUNFLORA
	menu_mon_pals RED,    BLUE   ; YANMA
	menu_mon_pals BLUE,   PURPLE ; WOOPER
	menu_mon_pals BLUE,   PURPLE ; QUAGSIRE
	menu_mon_pals PURPLE, GREEN  ; ESPEON
	menu_mon_pals BROWN,  BLUE   ; UMBREON
	menu_mon_pals BLUE,   PURPLE ; MURKROW
	menu_mon_pals PINK,   BLUE   ; SLOWKING
	menu_mon_pals PURPLE, BROWN  ; MISDREAVUS
	menu_mon_pals GRAY,   BLUE   ; UNOWN
	menu_mon_pals BLUE,   PURPLE ; WOBBUFFET
	menu_mon_pals RED,    BLUE   ; GIRAFARIG
	menu_mon_pals TEAL,   PINK   ; PINECO
	menu_mon_pals RED,    BROWN  ; FORRETRESS
	menu_mon_pals BLUE,   PURPLE ; DUNSPARCE
	menu_mon_pals PURPLE, GRAY   ; GLIGAR
	menu_mon_pals GRAY,   BROWN  ; STEELIX
	menu_mon_pals PINK,   BLUE   ; SNUBBULL
	menu_mon_pals PURPLE, GRAY   ; GRANBULL
	menu_mon_pals BLUE,   PURPLE ; QWILFISH
	menu_mon_pals RED,    GREEN  ; SCIZOR
	menu_mon_pals RED,    BLUE   ; SHUCKLE
	menu_mon_pals BLUE,   PURPLE ; HERACROSS
	menu_mon_pals RED,    PURPLE ; SNEASEL
	menu_mon_pals BROWN,  GREEN  ; TEDDIURSA
	menu_mon_pals BROWN,  GREEN  ; URSARING
	menu_mon_pals RED,    GRAY   ; SLUGMA
	menu_mon_pals RED,    BLUE   ; MAGCARGO
	menu_mon_pals BROWN,  BLUE   ; SWINUB
	menu_mon_pals BROWN,  BROWN  ; PILOSWINE
	menu_mon_pals PINK,   TEAL   ; CORSOLA
	menu_mon_pals BLUE,   GRAY   ; REMORAID
	menu_mon_pals RED,    BROWN  ; OCTILLERY
	menu_mon_pals RED,    PURPLE ; DELIBIRD
	menu_mon_pals PURPLE, BLUE   ; MANTINE
	menu_mon_pals RED,    GREEN  ; SKARMORY
	menu_mon_pals RED,    BLUE   ; HOUNDOUR
	menu_mon_pals RED,    BLUE   ; HOUNDOOM
	menu_mon_pals BLUE,   PURPLE ; KINGDRA
	menu_mon_pals BLUE,   TEAL   ; PHANPY
	menu_mon_pals GRAY,   BROWN  ; DONPHAN
	menu_mon_pals BLUE,   BLUE   ; PORYGON2
	menu_mon_pals BROWN,  GREEN  ; STANTLER
	menu_mon_pals BROWN,  GREEN  ; SMEARGLE
	menu_mon_pals BROWN,  BLUE   ; TYROGUE
	menu_mon_pals BROWN,  PURPLE ; HITMONTOP
	menu_mon_pals PURPLE, PINK   ; SMOOCHUM
	menu_mon_pals BROWN,  PINK   ; ELEKID
	menu_mon_pals RED,    PINK   ; MAGBY
	menu_mon_pals PINK,   GRAY   ; MILTANK
	menu_mon_pals RED,    PINK   ; BLISSEY
	menu_mon_pals PURPLE, PINK   ; RAIKOU
	menu_mon_pals RED,    BROWN  ; ENTEI
	menu_mon_pals BLUE,   GRAY   ; SUICUNE
	menu_mon_pals GREEN,  BROWN  ; LARVITAR
	menu_mon_pals BLUE,   PURPLE ; PUPITAR
	menu_mon_pals GREEN,  BROWN  ; TYRANITAR
	menu_mon_pals BLUE,   TEAL   ; LUGIA
	menu_mon_pals RED,    BROWN  ; HO_OH
	menu_mon_pals GREEN,  PINK   ; CELEBI
	assert_table_length NUM_POKEMON
	menu_mon_pals RED,    RED    ; unused
	menu_mon_pals GREEN,  RED    ; EGG ; Make both colors match for normal egg behavior
	assert_table_length EGG
