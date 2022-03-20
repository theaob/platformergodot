extends KinematicBody2D

var velocity = Vector2.ZERO;

const X_SPEED = 250;
const JUMP_FORCE = -1000;
const BOUNCE_FORCE = -500;
const HURT_X_VELOCITY = 800;
const GRAVITY = 35;
const LERP_WEIGHT = 0.15;

func _physics_process(_delta):
	if Input.is_action_pressed("right"):
		velocity.x = X_SPEED;
		$AnimatedSprite.play("walk");
		$AnimatedSprite.flip_h = false;
	elif Input.is_action_pressed("left"):
		velocity.x = -X_SPEED;
		$AnimatedSprite.play("walk");
		$AnimatedSprite.flip_h = true;
	else:
		$AnimatedSprite.play("idle");
		
	if not is_on_floor():
		$AnimatedSprite.play("jump")

	velocity.y = velocity.y + GRAVITY;
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_FORCE;
		
	velocity = move_and_slide(velocity, Vector2.UP);

	velocity.x = lerp(velocity.x, 0, LERP_WEIGHT);

func bounce():
	velocity.y = BOUNCE_FORCE;
	
func hurt(var enemy_x_pos):
	$HurtTimer.start();
	set_modulate(Color.red);
	velocity.y = BOUNCE_FORCE * 0.5;
	if enemy_x_pos > position.x:
		velocity.x = -HURT_X_VELOCITY;
	elif enemy_x_pos < position.x:
		velocity.x = HURT_X_VELOCITY;
	Input.action_release("left");
	Input.action_release("right");

func _on_FallZone_body_entered(_body):
	var _result = get_tree().change_scene("res://Scenes/Level1.tscn");
	
func _on_HurtTimer_timeout():
	set_modulate(Color.white);
