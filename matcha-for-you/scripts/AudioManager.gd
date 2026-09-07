extends Node
@onready var music_player: AudioStreamPlayer = $MusicPlayer
@onready var sfx_player: AudioStreamPlayer = $SfxPlayer 

func play_music(stream: AudioStream, fade_duration: float = 1.0) -> void:
	if music_player.stream == stream and music_player.playing:
		return
	
	if music_player.playing:
		var tween = create_tween()
		tween.tween_property(music_player, "volume_db", -40, fade_duration)
		await tween.finished
	
	music_player.stream = stream
	music_player.volume_db = 0
	music_player.play()

func stop_music() -> void: 
	music_player.stop() 
	
func play_sfx(stream: AudioStream) -> void: 
	sfx_player.stream = stream 
	sfx_player.play() 
	
func set_music_volume(value: float) -> void: 
	var bus_idx = AudioServer.get_bus_index("Music") 
	AudioServer.set_bus_volume_db(bus_idx, linear_to_db(value)) 
	
func set_sfx_volume(value: float) -> void: 
	var bus_idx = AudioServer.get_bus_index("SFX") 
	AudioServer.set_bus_volume_db(bus_idx, linear_to_db(value))
