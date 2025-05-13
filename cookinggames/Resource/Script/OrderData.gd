extends Resource

class_name OrderData

@export var characterIcon : Texture2D
@export var foodOrder : FoodData

@export var hatedIngredientsData : Array[IngredientData]


func satisfactionPoint(givenfood :FoodData, ingredientsUsedData : Array[IngredientData]):
	if givenfood.foodName != foodOrder.foodName:
		return 0
	
	var currentSatisfactionPoint = 100.0
	
	return currentSatisfactionPoint
