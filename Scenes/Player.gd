extends KinematicBody2D

var velocity = Vector2(0,0);
const X_SPEED = 180;
const LERP_WEIGHT = 0.15;

func _physics_process(delta):
	if Input.is_action_pressed("right"):
		velocity.x = X_SPEED;
	if Input.is_action_pressed("left"):
		velocity.x = -X_SPEED;

	velocity.y = velocity.y + 30;
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = -500;
	
	velocity = move_and_slide(velocity);

	velocity.x = lerp(velocity.x, 0, LERP_WEIGHT);
