DEF NUM_ODD_EGGS EQU 14

MACRO prob
	DEF prob_total += \1
	dw prob_total * $ffff / 100
ENDM

OddEggProbabilities:
; entries correspond to OddEggs (below)
	table_width 2, OddEggProbabilities
DEF prob_total = 0
; Pichu
	prob 8
	prob 1
; Cleffa
	prob 16
	prob 3
; Igglybuff
	prob 16
	prob 3
; Smoochum
	prob 14
	prob 2
; Magby
	prob 10
	prob 2
; Elekid
	prob 12
	prob 2
; Tyrogue
	prob 10
	prob 1
	assert_table_length NUM_ODD_EGGS
	assert prob_total == 100, "OddEggProbabilities do not sum to 100%!"

OddEggs:
	table_width NICKNAMED_MON_STRUCT_LENGTH, OddEggs

	db PICHU
	db NO_ITEM
	db THUNDERSHOCK, CHARM, DIZZY_PUNCH, 0
	dw 02048 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 0, 0, 0, 0 ; DVs
	db 30, 20, 10, 0 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 	 ; Level
	db 0, 0  ; Status
	bigdw 0  ; HP
	bigdw 11 ; Max HP
	bigdw 5  ; Atk
	bigdw 5  ; Def
	bigdw 6  ; Spd
	bigdw 5  ; SAtk
	bigdw 5  ; SDef
	db "EGG@@@@@@@@"

	db PICHU
	db NO_ITEM
	db THUNDERSHOCK, CHARM, DIZZY_PUNCH, 0
	dw 00256 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 2, 10, 10, 10 ; DVs
	db 30, 20, 10, 0 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 	 ; Level
	db 0, 0  ; Status
	bigdw 0  ; HP
	bigdw 11 ; Max HP
	bigdw 5  ; Atk
	bigdw 6  ; Def
	bigdw 7  ; Spd
	bigdw 6  ; SAtk
	bigdw 6  ; SDef
	db "EGG@@@@@@@@"
  ; DVS : ATK, DEF, SPD, SPCL
	db CLEFFA
	db NO_ITEM
	db POUND, CHARM, DIZZY_PUNCH, 0
	dw 04096 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 0, 0, 0, 0 ; DVs
	db 35, 20, 10, 0 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 	 ; Level
	db 0, 0  ; Status
	bigdw 0  ; HP
	bigdw 12 ; Max HP
	bigdw 5  ; Atk
	bigdw 5  ; Def
	bigdw 5  ; Spd
	bigdw 5  ; SAtk
	bigdw 6  ; SDef
	db "EGG@@@@@@@@"

	db CLEFFA
	db NO_ITEM
	db POUND, CHARM, DIZZY_PUNCH, 0
	dw 00768 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 2, 10, 10, 10 ; DVs
	db 35, 20, 10, 0 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 	 ; Level
	db 0, 0  ; Status
	bigdw 0  ; HP
	bigdw 12 ; Max HP
	bigdw 5  ; Atk
	bigdw 6  ; Def
	bigdw 6  ; Spd
	bigdw 6  ; SAtk
	bigdw 7  ; SDef
	db "EGG@@@@@@@@"

	db IGGLYBUFF
	db NO_ITEM
	db SING, CHARM, DIZZY_PUNCH, 0
	dw 04096 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 0, 0, 0, 0 ; DVs
	db 15, 20, 10, 0 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0  ; Status
	bigdw 0  ; HP
	bigdw 12 ; Max HP
	bigdw 5  ; Atk
	bigdw 5  ; Def
	bigdw 5  ; Spd
	bigdw 5  ; SAtk
	bigdw 5  ; SDef
	db "EGG@@@@@@@@"

	db IGGLYBUFF
	db NO_ITEM
	db SING, CHARM, DIZZY_PUNCH, 0
	dw 00768 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 2, 10, 10, 10 ; DVs
	db 15, 20, 10, 0 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 12 ; Max HP
	bigdw 5  ; Atk
	bigdw 6  ; Def
	bigdw 6  ; Spd
	bigdw 6  ; SAtk
	bigdw 6  ; SDef
	db "EGG@@@@@@@@"

	db SMOOCHUM
	db NO_ITEM
	db POUND, LICK, DIZZY_PUNCH, 0
	dw 03584 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 0, 0, 0, 0 ; DVs
	db 35, 30, 10, 0 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 11 ; Max HP
	bigdw 5 ; Atk
	bigdw 5 ; Def
	bigdw 6 ; Spd
	bigdw 6 ; SAtk
	bigdw 6 ; SDef
	db "EGG@@@@@@@@"

	db SMOOCHUM
	db NO_ITEM
	db POUND, LICK, DIZZY_PUNCH, 0
	dw 00512 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 2, 10, 10, 10 ; DVs
	db 35, 30, 10, 0 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 14 ; Max HP
	bigdw 5 ; Atk
	bigdw 6 ; Def
	bigdw 7 ; Spd
	bigdw 7 ; SAtk
	bigdw 7 ; SDef
	db "EGG@@@@@@@@"

	db MAGBY
	db NO_ITEM
	db EMBER, DIZZY_PUNCH, 0, 0
	dw 02560 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 0, 0, 0, 0 ; DVs
	db 25, 10, 0, 0 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 11 ; Max HP
	bigdw 6 ; Atk
	bigdw 5 ; Def
	bigdw 6 ; Spd
	bigdw 6 ; SAtk
	bigdw 6 ; SDef
	db "EGG@@@@@@@@"

	db MAGBY
	db NO_ITEM
	db EMBER, DIZZY_PUNCH, 0, 0
	dw 00512 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 2, 10, 10, 10 ; DVs
	db 25, 10, 0, 0 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 11 ; Max HP
	bigdw 6 ; Atk
	bigdw 6 ; Def
	bigdw 7 ; Spd
	bigdw 7 ; SAtk
	bigdw 7 ; SDef
	db "EGG@@@@@@@@"

	db ELEKID
	db NO_ITEM
	db QUICK_ATTACK, LEER, DIZZY_PUNCH, 0
	dw 03072 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 0, 0, 0, 0 ; DVs
	db 30, 30, 10, 0 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 11 ; Max HP
	bigdw 6 ; Atk
	bigdw 5 ; Def
	bigdw 6 ; Spd
	bigdw 6 ; SAtk
	bigdw 6 ; SDef
	db "EGG@@@@@@@@"

	db ELEKID
	db NO_ITEM
	db QUICK_ATTACK, LEER, DIZZY_PUNCH, 0
	dw 00512 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 2, 10, 10, 10 ; DVs
	db 30, 30, 10, 0 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 11 ; Max HP
	bigdw 6 ; Atk
	bigdw 6 ; Def
	bigdw 7 ; Spd
	bigdw 7 ; SAtk
	bigdw 7 ; SDef
	db "EGG@@@@@@@@"

	db TYROGUE
	db NO_ITEM
	db TACKLE, DIZZY_PUNCH, 0, 0
	dw 02560 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 0, 0, 0, 0 ; DVs
	db 35, 10, 0, 0 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 11 ; Max HP
	bigdw 5 ; Atk
	bigdw 5 ; Def
	bigdw 5 ; Spd
	bigdw 5 ; SAtk
	bigdw 5 ; SDef
	db "EGG@@@@@@@@"

	db TYROGUE
	db NO_ITEM
	db TACKLE, DIZZY_PUNCH, 0, 0
	dw 00256 ; OT ID
	dt 0 ; Exp
	; Stat exp
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	bigdw 0
	dn 2, 10, 10, 10 ; DVs
	db 35, 10, 0, 0 ; PP
	db 20 ; Step cycles to hatch
	db 0, 0, 0 ; Pokerus, Caught data
	db 1 ; Level
	db 0, 0 ; Status
	bigdw 0 ; HP
	bigdw 11 ; Max HP
	bigdw 5 ; Atk
	bigdw 6 ; Def
	bigdw 6 ; Spd
	bigdw 6 ; SAtk
	bigdw 6 ; SDef
	db "EGG@@@@@@@@"

	assert_table_length NUM_ODD_EGGS
