extends Resource

class_name OrderData


@export var foodOrder : FoodData

@export var hatedIngredientsData : Array[IngredientData]
@export var characterInfoData : CharacterData


func satisfactionPoint(givenfood :FoodData, ingredientsUsedData : Array[IngredientData]):
	if givenfood.foodName != foodOrder.foodName:
		return 0
	
	var currentSatisfactionPoint = 100.0
	
	return currentSatisfactionPoint
