extends CharacterBody2D

@export var speed := 300.0 
var can_shoot: bool = true # Velocidade ajustável no Inspetor[cite: 2]
signal laser(pos)  # Padronizado com 's'

func _physics_process(delta: float) -> void:
	# Obter o vetor de direção para cima, baixo, esquerda e direita[cite: 2]
	var direction := Input.get_vector("left", "right", "up", "down")
	
	# Aplicar velocidade ao movimento
	velocity = direction * speed
	var screen_size = get_viewport_rect().size
	
	# Movimentar o corpo e lidar com colisões
	move_and_slide()
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	if Input.is_action_just_pressed("shoot") and can_shoot:
		laser.emit($LazerStartsPos.global_position)
		can_shoot = false 
		$LazerTimer.start()
	
func _on_lazer_timer_timeout() -> void:
	can_shoot = true
