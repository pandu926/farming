extends CharacterBody2D

const SPEED = 300.0

@onready var anime = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var direction_x := Input.get_axis("ui_left", "ui_right")  # Mengambil input horizontal
	var direction_y := Input.get_axis("ui_up", "ui_down")    # Mengambil input vertikal
	
	# Pergerakan horizontal
	if direction_x:
		velocity.x = direction_x * SPEED
		if direction_x < 0:
			anime.play("left")  # Animasi bergerak kiri
		else:
			anime.play("right")  # Animasi bergerak kanan
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# Pergerakan vertikal
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()
