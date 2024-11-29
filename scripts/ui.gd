extends Control

@onready var p_2_vida: Label = $LabelP2/P2Vida
@onready var p_2_dano: Label = $LabelP2/P2Dano
@onready var p_1_vida: Label = $LabelP1/P1Vida
@onready var p_1_dano: Label = $LabelP1/P1Dano
@onready var player_1: Player = $"../Arena/Player1"
@onready var player_2: Player = $"../Arena/Player2"
@onready var victory_label: Label = $VictoryLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	victory_label.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	p_2_vida.text = "Vidas: " + str(player_2.vida)
	p_2_dano.text = "Dano: " + str(player_2.dano)
	p_1_vida.text = "Vidas: " + str(player_1.vida)
	p_1_dano.text = "Dano: " + str(player_1.dano)
	
	if player_1.vida <= 0:
		victory_label.text = str("Player ", player_2.jogador, " Wins!")
		victory_label.visible = true
	elif player_2.vida <= 0:
		victory_label.text = str("Player ", player_1.jogador, " Wins!")
		victory_label.visible = true


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
