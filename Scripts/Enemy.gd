extends KinematicBody2D

var velocity = Vector2();
export var direction = -1; #-1 right 1 left
export var detectsCliffs = true;

const GRAVITY = 35;
const X_SPEED = 50;

func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = true;
	
	$FloorChecker.enabled = detectsCliffs;
	$FloorChecker.position.x = $CollisionShape2D.shape.get_extents().x * direction;

func _physics_process(delta):
	if is_on_wall() or not $FloorChecker.is_colliding() and detectsCliffs and is_on_floor():
		direction *= -1;
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h;
		$FloorChecker.position.x = $CollisionShape2D.shape.get_extents().x * direction;

	velocity.x = X_SPEED * direction;
	velocity.y += GRAVITY;
	
	
	velocity = move_and_slide(velocity, Vector2.UP, true);
