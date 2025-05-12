extends Panel

var orderData : OrderData : set = onOrderDataSet
@onready var hatedIngPath = preload("res://src/hatedIngredientNode/Scene/hated_ingredient_node.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func onOrderDataSet(_orderData):
	modulate = Color(1,1,1,0)
	await get_tree().create_tween().tween_property(self,"modulate",Color(1,1,1,1),2).finished
	
	orderData = _orderData
	deleteOldIngredients()
	$foodDetails/Label.text = orderData.foodOrder.foodName
	$icon.texture = orderData.characterIcon
	for hatedIngredientData in orderData.hatedIngredientsData:
		var hatedIngNode = hatedIngPath.instantiate()
	
		$hatedIngredientCont/hatedIngredients.add_child(hatedIngNode)
		hatedIngNode.texture = hatedIngredientData.ingredientImage


func deleteOldIngredients():
	for node in $hatedIngredientCont/hatedIngredients.get_children():
		node.queue_free()
