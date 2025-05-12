extends GridContainer


@onready var ingBtnPath = preload("res://src/IngBtn/Scene/ing_btn.tscn")
@export var ingredientsData : Array[IngredientData]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawnIngredients()
	pass # Replace with function body.



func spawnIngredients():
	deleteAllIngredients()
	
	for ingredientData in ingredientsData:
		var ingBtn = ingBtnPath.instantiate()
		add_child(ingBtn)
		ingBtn.ingredientData = ingredientData
		ingBtn.connect("IngSelected",Callable(self,"ingSelected"))


func deleteAllIngredients():
	for node in get_children():
		node.queue_free()


func ingSelected(ingredientData):
	get_parent().get_node("potContainer").spawnPotItem(ingredientData)
