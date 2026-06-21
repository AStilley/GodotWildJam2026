extends Control

@export var dice_face: TextureRect
@export var highlight: TextureRect
var hovering: bool
@export var price: int
@export var itemID: String
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	price = int($TextureRect/Price.text)
	GameManager.connect("StopBuying",resetChoice)

func _process(delta: float) -> void:
	if is_mouse_over_dice():
		hovering = true
		dice_face.scale = Vector2(2,2)
		#highlight.scale = Vector2(2.1,2.1)
	else:
		hovering = false
		dice_face.scale = Vector2(1,1)
		#highlight.scale = Vector2(1.2,1.2)
func is_mouse_over_dice() -> bool:
	var mouse_pos: Vector2 = get_global_mouse_position()
	var sprite_rect = Rect2(dice_face.global_position, dice_face.texture.get_size())
	return sprite_rect.has_point(mouse_pos)

func _input(event) -> void:
	if event is InputEventMouseButton and event.button_index== MOUSE_BUTTON_LEFT:
		if GameManager.currentlyBuying == false:
			if event.pressed and hovering:
				print(GameManager.can_afford(price))
				if GameManager.can_afford(price):
					GameManager.currentlyBuying = true
					GameManager.currentItemPrice = price
					GameManager.currentBuyItem = get_index()
					GameManager.currentItemID = itemID
					highlight.visible = true
func resetChoice()->void:
	highlight.visible = false	
	pass
