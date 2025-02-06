extends CharacterBody2D

@export var speed = 100

@export var animate : AnimatedSprite2D

@export var bullet_scene:PackedScene

var is_game_over:bool = false

var face = 1

func _process(delta: float) -> void:
	if is_game_over || velocity == Vector2.ZERO:
		$running.stop()
	elif not $running.playing:
		$running.play()
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if not is_game_over:
		if velocity == Vector2.ZERO :
			animate.play("idle")
		else:
			if velocity == Vector2.LEFT * speed:
				animate.flip_h = true
				face = -1
			elif velocity == Vector2.RIGHT * speed:
				animate.flip_h = false
				face = 1
			animate.play("run")
		
		velocity = Input.get_vector("Left","Right","Up","Down") * speed
		move_and_slide()
		
		if Input.is_action_just_pressed("Shoot") && not is_game_over:
			var bullet = bullet_scene.instantiate()
			bullet.position = position + Vector2(face*16,6)
			bullet.setDirect(face)
			$audio_shoot.play()
			get_tree().current_scene.add_child(bullet)
	

func die():
	is_game_over = true
	animate.play("die")
	$restart_game.start()
	


func _on_restart_game_timeout() -> void:
	get_tree().reload_current_scene()
