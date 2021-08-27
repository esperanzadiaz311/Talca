extends Area2D


export var SPEED = 300
var GRAVITY = 400

func _ready() -> void:
	var _error = connect("body_entered", self, "_on_body_entered")

func _physics_process(delta: float) -> void:
	position += transform.x * SPEED * delta

func _on_body_entered(body: Node):
	if not body.is_in_group("player"):
		queue_free()
