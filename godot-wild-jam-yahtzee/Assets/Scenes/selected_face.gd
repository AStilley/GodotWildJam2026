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
	if GameManager.player_dice[get_index()] != null:
		match GameManager.player_dice[get_index()]:
			"big_point_roll":
				$TextureRect.texture = load("res://Assets/Images/+20.png")
				pass
			"double_points":
				$TextureRect.texture = load("res://Assets/Images/2x.png")
				pass
			"gold_roll":
				$TextureRect.texture =	load("res://Assets/Images/$3.png"	)		
				pass
			"point_roll":
				$TextureRect.texture =	load("res://Assets/Images/+10.png"	)		
				pass
			"slow_dice":
				$TextureRect.texture =	load("res://Assets/Images/Slow.png"	)		
				pass				
		pass
func is_mouse_over_dice() -> bool:
	var mouse_pos: Vector2 = get_global_mouse_position()
	var sprite_rect = Rect2(dice_face.global_position, dice_face.texture.get_size())
	return sprite_rect.has_point(mouse_pos)
	
func _input(event) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed and hovering:
			if GameManager.currentlyBuying:
				if GameManager.currentItemID != "":
					GameManager.change_dice_face(get_index(), GameManager.currentItemID)
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
