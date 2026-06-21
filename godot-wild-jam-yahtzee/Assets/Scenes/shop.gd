extends Control

@export var sell_dice_face:PackedScene
@export var dice_container: HBoxContainer
@export var items: Array[PackedScene]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#Creates 3 dice to sell
	for i in range(3):
		print("Test")
		var sell_dice_face_instance = items.pick_random().instantiate()
		dice_container.add_child(sell_dice_face_instance)
	GameManager.connect("BuyItem",ItemBought)	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_label_pressed(KEY_U):
		get_tree().change_scene_to_file("res://Assets/Scenes/face_selection.tscn")
		pass
	pass


func ItemBought()->void:
	print(GameManager.currentBuyItem)
	
	#Use the index to find the item that needs to be deleted
	$CenterContainer/VBoxContainer/HBoxContainerDice.get_child(GameManager.currentBuyItem).queue_free()
		
	
	GameManager.resetBuying()
	pass
