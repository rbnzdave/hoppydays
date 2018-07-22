extends KinematicBody2D

const SPEED = 750
const GRAVITY = 3600
const UP = Vector2(0,-1)
const JUMP_SPEED = -1500

var motion = Vector2()
export var world_limit = 2000
export var screen_limit = 1080
var dying = false

func _ready():
	Global.Player = self

func _physics_process(delta):
	update_motion(delta)
	
func _process(delta):
	update_animation(motion)
	
func update_motion(delta):
	fall(delta)
	if (!dying):
		run()
		jump()
		check_for_death()
	else:
		throws_of_death()
	move_and_slide(motion, UP)
	
	
func update_animation(motion):
	$AnimatedSprite.update(motion, dying)


func throws_of_death():
	if !dying:
		motion.y = JUMP_SPEED * 1.5
		$CollisionShape2D.free()
		$AnimatedSprite.play("hurt")
	dying = true
	if (position.y > world_limit):
		Global.GameState.end_game()

func fall(delta):
	if is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 0
	else:
		motion.y += GRAVITY	*delta
	
func run():
	motion.x = 0
	if Input.is_action_pressed("ui_right"):
		motion.x += SPEED
	if Input.is_action_pressed("ui_left"):
		motion.x -= SPEED 

func jump():
	if Input.is_action_pressed("ui_up") && is_on_floor():
		motion.y += JUMP_SPEED
	
func check_for_death():
	if position.y > screen_limit:
		throws_of_death()
		print("died")

func hurt():
	motion.y = JUMP_SPEED;
	$AnimatedSprite.play("hurt")