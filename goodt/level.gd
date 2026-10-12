extends Node2D
var meteor_scene : PackedScene = load("res://meteor.tscn")
var lazer_scene : PackedScene = load("res://lazer.tscn")

func _on_timer_meteors_timeout() -> void:
	var meteor = meteor_scene.instantiate()
	$Meteors.add_child(meteor)


func _on_player_laser(pos: Variant) -> void:
	var lazer = lazer_scene.instantiate()
	$Lazers.add_child(lazer)
	lazer.global_position = pos
