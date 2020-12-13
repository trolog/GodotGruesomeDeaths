extends Area2D

export(PackedScene) var player_saw_death : PackedScene

onready var ani = $AnimatedSprite




func _on_saw_body_entered(body):
	if(!body.is_in_group("player")) : return # only do this code if it's the player
	
	body.hide()
	body.set_physics_process(false)
	Game.timer.start(2)
	do_death_animation()
	pass # Replace with function body.

func do_death_animation():
	var thedead = player_saw_death.instance()
	ani.animation = "blood"
	add_child(thedead)
	thedead.position.x -= 35
