extends Control

@export var ordersData : Array[OrderData]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	ordersData.shuffle()
	showCurrentCustomer()
	

func _input(event: InputEvent) -> void:
	
	if Input.is_action_just_pressed("ui_accept"):
		showCurrentCustomer()

func showCurrentCustomer():
	if ordersData.size() == 0:
		return
	var currentCustomer = ordersData[0]
	
	$orderInfo.orderData = currentCustomer
	
	ordersData.erase(currentCustomer)
