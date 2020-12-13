extends Node

onready var timer = $Timer


func _on_Timer_timeout():
	get_tree().reload_current_scene()
	pass # Replace with function body.
