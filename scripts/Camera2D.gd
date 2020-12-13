extends Camera2D

var player : KinematicBody2D

func _ready():
	player = return_player()
	
func return_player() -> KinematicBody2D:
	for i in get_tree().get_nodes_in_group("player"):
		return i
	return null
	pass
	
func _physics_process(delta):
	if(player != null):
		global_position = player.global_position
	else:
		player = return_player()
