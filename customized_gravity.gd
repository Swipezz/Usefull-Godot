extends Node

var jumpHeight : float 
var jumpTimeToPeak : float
var jumpTimeToDescent : float

@onready var jumpVelocity : float = ((2.0 * jumpHeight) / jumpTimeToPeak) * -1.0
@onready var jumpGravity : float = ((-2.0 * jumpHeight) / (jumpTimeToPeak * jumpTimeToPeak)) * -1.0
@onready var fallGravity : float = ((-2.0 * jumpHeight) / (jumpTimeToDescent * jumpTimeToDescent)) * -1.0

func _physics_process(delta: float) -> void:
	if !owner.is_on_floor():
		owner.velocity.y += getGravity() * delta

func getGravity() -> float:
	return jumpGravity if owner.velocity.y < 0.0 else fallGravity