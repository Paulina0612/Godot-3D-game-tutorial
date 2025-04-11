extends Label

var counter=0

func _ready():
	text = String(counter)

func _on_Coin_coinCollected():
	counter+=1
	_ready()
	
	if counter == 10:
		get_tree().change_scene("res://Assets/YouWon.tscn")
