extends KinematicBody2D

var velocity = Vector2(0,0);
var coins = 0;

const X_SPEED = 250;
const JUMP_FORCE = -1000;
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


func add_coin():
	coins = coins + 1;

func _on_FallZone_body_entered(_body):
	var _result = get_tree().change_scene("res://Scenes/Level1.tscn");
	
