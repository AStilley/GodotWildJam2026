extends Control
#If the player clicks this one, 

#If the player clicks the coresponding dice, the dice is selected
#This is used to put dice faces onto the dice

@export var button: TextureRect
var hovering: bool

func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
		if is_mouse_over_dice():
			hovering = true
		else:
			hovering = false

func is_mouse_over_dice() -> bool:
	var mouse_pos: Vector2 = get_global_mouse_position()
	var sprite_rect = Rect2(button.global_position, button.texture.get_size())
	return sprite_rect.has_point(mouse_pos)
	
func _input(event) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and hovering:
			print("Back Button")
			GameManager.resetBuying()
			GameManager.StopBuying.emit()
			pass
