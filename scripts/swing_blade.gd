extends Area2D

export(PackedScene) var player_head : PackedScene
export(PackedScene) var player_body : PackedScene

var has_killed = false # this will stop a death loop

onready var ani = $AnimatedSprite


func _on_swing_blade_body_entered(body):
	if(!body.is_in_group("player")): return # don't trigger if not player
	if(has_killed) : return # player dead, don't do this gain
	
	body.hide()
	body.set_physics_process(false)
	Game.timer.start(2)
	do_death_animation(body)
	pass # Replace with function body.
	
func do_death_animation(body):
	var pbody = player_body.instance()
	var phead : RigidBody2D = player_head.instance()
	#Insert body and head into main node
	
	get_node("/root/main").add_child((pbody))
	#get_node("/root/main").call_deferred("add_child",pbody)
	get_node("/root/main").call_deferred("add_child",phead)
	
	#Change the animation of the swing blade to the bloody one
	ani.animation = "blood"
	#Update the headposition just right
	
	phead.global_position = body.global_position
	phead.apply_impulse (Vector2(0.2,0.2),Vector2(rand_range(-100,100),rand_range(-25,-60)))
	phead.add_torque(rand_range(-100,100))
	
	#update the body position just right
	pbody.global_position = body.global_position
	#pbody.global_position.y += 18
	#pbody.global_position.x += 6
	pbody.get_node("player_body").flip_h = body.get_node("AnimatedSprite").flip_h
	
	#We've finished and don't want to repeat this so set has_killed true
	has_killed = true
