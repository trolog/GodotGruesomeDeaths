extends Node2D

onready var ground_ray : RayCast2D = $ground_ray
var max_speed = 9

func _physics_process(delta):
	if(!ground_ray.is_colliding()):
		global_position.y += lerp(0,max_speed,0.2)
