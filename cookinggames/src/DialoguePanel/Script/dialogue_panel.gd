extends Panel

signal dialogueFinished

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hideDialogue()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func hideDialogue():
	hide()


func showDialogue(characterInfo :CharacterData,orderStatus : int):
	show()
	$CharacterName.text = characterInfo.characterName
	
	match orderStatus:
		1:
			$RichTextLabel.text = characterInfo.getRandGoodLine()
		2:
			$RichTextLabel.text = characterInfo.getRandBadLine()
		3:
			$RichTextLabel.text = characterInfo.getRandConfusedLine()


func _on_gui_input(event: InputEvent) -> void:
	
	if event is InputEventMouseButton:
		if visible:
			await hideDialogue()
			emit_signal("dialogueFinished")
