extends Node


signal StopBuying
signal BuyItem
#If the player decides not to buy something

#var player_dice = [
	#[null,null,null,null,null,null], #Dice 1
	#[null,null,null,null,null,null], #Dice 2
	#[null,null,null,null,null,null], #Dice 3	
	#[null,null,null,null,null,null], #Dice 4
	#[null,null,null,null,null,null] #Dice 5
	#] 
	
var player_dice = [null,null,null,null,null,null]
#Way to minimize scope in case of emergency - All dice have the same effect faces

var money: int =0
var mutations = []

var currentSelectedFaceIndex: int = -1
var currentlyBuying:bool = false
var currentItemPrice: int = 0

var currentBuyItem: int = -1

func add_money(amount: int) -> void:
	money += amount
func can_afford(cost: int) -> bool:
	return money >= cost
func spend_money(cost: int) -> bool:
	if money < cost:
		return false
	money -= cost
	return true
func change_dice_face(dice_num: int,dice_effect: String)-> bool:
	player_dice[dice_num]= dice_effect
	return true
func add_mutations(mutation: String) -> void:
	mutations.append(mutation)
func reset_data()-> void:
	player_dice = [null,null,null,null,null,null]
	money =0
	mutations = []
func resetBuying()-> void:
	#Resets the ability to buy something
	currentSelectedFaceIndex = -1
	currentlyBuying = false
	currentItemPrice = 0
	currentBuyItem = -1
	pass
