NightMusicTable:
MACRO night_music
	db \1, \2
ENDM
	night_music MUSIC_NEW_BARK_TOWN,    MUSIC_NEW_BARK_TOWN_NIGHT
	db -1 ; end
