extends Area2D

func _on_coin_body_entered(_body):
	$AnimationPlayer.play("coin_animation");

func _on_AnimationPlayer_animation_finished(_anim_name):
	queue_free();
