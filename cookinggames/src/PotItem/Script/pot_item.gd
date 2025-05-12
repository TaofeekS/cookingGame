extends TextureRect

signal itemDeleted


var ingredientData : IngredientData : set = setIngredientData

# Called when the node enters the scene tree for the first ti


func setIngredientData(_ingredientData : IngredientData ):
	ingredientData = _ingredientData
	texture = ingredientData.ingredientImage


func _on_close_btn_pressed() -> void:
	emit_signal("itemDeleted",self)
