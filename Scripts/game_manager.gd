extends Node2D


@export var slime_scene:PackedScene

@export var spawn_timer:Timer

@export var score = 0

@export var score_label:Label

@export var canvas_game_over:CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	spawn_timer.wait_time -= 0.1 * delta
	spawn_timer.wait_time = clamp(spawn_timer.wait_time,1,3)
	score_label.text = "分数:"+str(score)
	


func _on_timer_timeout() -> void:
	var slime = slime_scene.instantiate()
	slime.position = Vector2(randi_range(0,310),randi_range(50,110))
	get_tree().current_scene.add_child(slime)


func show_game_over():
	canvas_game_over.visible = true
	$game_over/final_score.text = "最终得分:"+str(score)
	$audio_game_over.play()
	
