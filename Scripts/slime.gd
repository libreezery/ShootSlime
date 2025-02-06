extends Area2D

@export var animate:AnimatedSprite2D

@export var speed = -40

var face = 1

var is_dead = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if position.x < -130:
		get_tree().current_scene.score -= 20
		if get_tree().current_scene.score < 0:
			get_tree().current_scene.show_game_over()
		queue_free()
	if not is_dead:
		position += Vector2(speed * face,0) * delta


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D && not is_dead:
		body.die()
		get_tree().current_scene.show_game_over()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		if !is_dead:
			area.queue_free()
		is_dead = true
		$audio_death.play()
		animate.play("death")
		get_tree().current_scene.score += randi_range(5,30)
		await get_tree().create_timer(1).timeout
		queue_free()
