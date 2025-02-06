extends Control

@export var shoot_button:TouchScreenButton

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	pass


func _on_touch_screen_button_3_pressed() -> void:
	shoot_button.connect("shoot",Callable())
