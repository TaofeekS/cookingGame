extends Resource
class_name CharacterData

@export var characterIcon : Texture2D
@export var characterName : String
@export_multiline var GoodDialoguesList : Array[String]
@export_multiline var BadDialoguesList : Array[String]
@export_multiline var ConfusedDialoguesList : Array[String]


func getGoodLine(index):
	return GoodDialoguesList[index]
	


func getRandGoodLine():
	var count = GoodDialoguesList.size()
	
	var rand = randi() % count
	return GoodDialoguesList[rand]


func getRandBadLine():
	var count = BadDialoguesList.size()
	
	var rand = randi() % count
	return BadDialoguesList[rand]


func getRandConfusedLine():
	var count = ConfusedDialoguesList.size()
	
	var rand = randi() % count
	return ConfusedDialoguesList[rand]
