extends Button

signal IngSelected
var ingredientData : IngredientData : set = setIngredientData

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func setIngredientData(_ingredientData : IngredientData ):
	ingredientData = _ingredientData
	icon = ingredientData.ingredientImage
	$foodName.text = ingredientData.ingredientName


func _on_pressed() -> void:
	emit_signal("IngSelected",ingredientData)
