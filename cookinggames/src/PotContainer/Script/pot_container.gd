extends ScrollContainer

@onready var potItemPath = preload("res://src/PotItem/Scene/pot_item.tscn")
var potItemsData : Array[IngredientData]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func spawnPotItem(ingredientData :IngredientData):
	potItemsData.append(ingredientData)
	
	var potItemNode = potItemPath.instantiate()
	
	$GridContainer.add_child(potItemNode)
	potItemNode.ingredientData = ingredientData
	potItemNode.connect("itemDeleted",Callable(self,"potItemDeleted"))


func potItemDeleted(node):
	var nodeIngredientData = node.ingredientData
	
	potItemsData.erase(nodeIngredientData)
	node.queue_free()
