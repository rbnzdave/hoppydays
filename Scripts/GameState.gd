extends Node2D

export var starting_lives = 3
var lives
var coins = 0;
var coinTarget = 20;

onready var GUI = Global.GUI

func _ready():
	Global.GameState = self
	lives = starting_lives
	update_GUI();

func  update_GUI():
	GUI.update_gui(lives)
	GUI.update_coins(coins)

	
func coin_up():
	coins += 1
	GUI.coin_pulse()
	update_GUI()
	var multiple_of_coin_target = (coins % coinTarget) == 0
	if (multiple_of_coin_target):
		lives += 1
		GUI.life_pulse()

func hurt():
	Global.Player.hurt()
	lives -= 1
	update_GUI();
	GUI.life_pulse()
	if ( lives < 0):
		end_game()

func end_game():
	print("true death")
	get_tree().change_scene("res://Scenes/GameOver.tscn")

