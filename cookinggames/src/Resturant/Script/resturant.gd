extends Control

@export var ordersData : Array[OrderData]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	ordersData.shuffle()
	showCurrentCustomer()
	$dialoguePanel.connect("dialogueFinished",Callable(self,"showCurrentCustomer"))
	

func _input(event: InputEvent) -> void:
	
	pass

func showCurrentCustomer():
	if ordersData.size() == 0:
		return
	var currentCustomer = ordersData.pop_front()
	
	$orderInfo.orderData = currentCustomer
	
	ordersData.push_back(currentCustomer)
	


func _on_button_pressed() -> void:
	var potItemsData : Array[IngredientData] = $potContainer.potItemsData.duplicate()
	
	if potItemsData.size() == 0:
		return
	
	$potContainer.deleteAllItem()
	
	var orderData : OrderData = $orderInfo.orderData
	var characterInfoData : CharacterData = orderData.characterInfoData
	
	var foodStatus = 1
	var hatedIngredientData = orderData.hatedIngredientsData
	
	for ingredientData in hatedIngredientData:
		for potItemData in potItemsData:
			if ingredientData.ingredientName == potItemData.ingredientName:
				foodStatus = 2
				break
	
	if foodStatus ==1 and potItemsData.size() ==1:
		foodStatus = 3
	
	$dialoguePanel.showDialogue(characterInfoData,foodStatus)
	
	pass # Replace with function body.
