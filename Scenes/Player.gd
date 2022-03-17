extends KinematicBody2D

var velocity = Vector2(0,0);
const X_SPEED = 250;
const JUMP_FORCE = -800;
const GRAVITY = 35;
const LERP_WEIGHT = 0.15;

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = X_SPEED;
	if Input.is_action_pressed("left"):
		velocity.x = -X_SPEED;

	velocity.y = velocity.y + GRAVITY;
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_FORCE;
	
	velocity = move_and_slide(velocity, Vector2.UP);

	velocity.x = lerp(velocity.x, 0, LERP_WEIGHT);
