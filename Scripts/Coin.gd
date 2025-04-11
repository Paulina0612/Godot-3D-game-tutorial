extends Area

signal coinCollected

func _ready():
	pass

func _on_Coin_body_entered(body):
	if body.name == "Steve":
		$Collection.play("Collection")
		$Timer.start()

func _on_Timer_timeout():
	emit_signal("coinCollected")
	queue_free()
