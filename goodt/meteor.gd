extends Area2D
var speed: int
var rotation_speed: int
var direction_x: float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	
	var  rgn := RandomNumberGenerator.new()
	var path: String = "res://OIP__" + str(rgn.randi_range(14, 15)) + "_-removebg-preview.png"
	$Sprite2D.texture = load(path)
	
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rgn.randi_range(0,width)
	var random_y = rgn.randi_range(-150,-50)
	position += Vector2(random_x,random_y)
	speed = rgn.randi_range(200,500)
	direction_x = rgn.randf_range(-1,1)
	rotation_speed = rgn.randi_range(40,100)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += Vector2(0, 1.0) * 400 * delta
	rotation_degrees += rotation_speed * delta
