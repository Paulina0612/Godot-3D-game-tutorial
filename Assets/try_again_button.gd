extends Button

func _ready():
	pass


func _on_try_again_button_pressed():
	get_tree().change_scene("res://Assets/Level.tscn")
