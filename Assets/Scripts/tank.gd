extends CharacterBody2D
class_name Player

@export_category("Variables")
@export var max_speed:float
@export var acceleration:float
@export var friction:float

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	move_behauvior()


func move_behauvior() -> void:
	var input: float =  Input.get_axis("ui_left","ui_right")
	if input != 0:
		velocity.x=  move_toward(velocity.x, input * max_speed, acceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, friction) 
	move_and_slide()
