extends Area2D

func _on_coin_body_entered(body):
	$AnimationPlayer.play("coin_animation");
	body.add_coin();

func _on_AnimationPlayer_animation_finished(_anim_name):
	queue_free();
