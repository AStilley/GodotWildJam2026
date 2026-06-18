extends Control
#If the player clicks this one, 

#If the player clicks the coresponding dice, the dice is selected
#This is used to put dice faces onto the dice

@export var dice_face: TextureRect
var hovering: bool

func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_mouse_over_dice():
		hovering = true
		dice_face.scale = Vector2(2,2)
	else:
		hovering = false
		dice_face.scale = Vector2(1,1)

func is_mouse_over_dice() -> bool:
	var mouse_pos: Vector2 = get_global_mouse_position()
	var sprite_rect = Rect2(dice_face.global_position, dice_face.texture.get_size())
	return sprite_rect.has_point(mouse_pos)
	
func _input(event) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and hovering:
			if GameManager.currentlyBuying:
				GameManager.change_dice_face(get_index(), "Something")
				#THIS WILL NEED TO CHANGE TO SOMETHING ELSE "Something" IS A PLACEHOLDER 
					#FOR THE ID NAME OF THE TYPE OF DICE FACE
				GameManager.BuyItem.emit()
				print(GameManager.player_dice)
				
				#Subtract money
				GameManager.spend_money(GameManager.currentItemPrice)

				pass
			
			#print(get_index())
			#GameManager.currentSelectedFaceIndex = 
			#Prints the index of the dice face. Remember index+1 is the dice face value
			pass
