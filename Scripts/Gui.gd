extends CanvasLayer

func _ready():
	Global.GUI = self

func update_gui(lives):
	$Banner/HBoxContainer/LifeCount.text = str(lives)

func update_coins(coins):
	$Banner/HBoxContainer/CoinCount.text = str(coins)

func coin_pulse():
	$AnimationPlayer.play("CoinPulse")

func life_pulse():
	$AnimationPlayer.play("LifePulse")