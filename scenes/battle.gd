extends Control

@export var cards: Array[PackedScene]

var player_deck = []
var enemy_deck = []

var card_num = 3

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	deal_cards()
	
func deal_cards():
	if cards.size() == 0:
		return
		
	for i in range(card_num):
		var new_player_card = cards[rng.randi_range(0, cards.size() - 1)].instantiate()
		%PlayerDeck.add_child(new_player_card)
		var enemy_player_card = cards[rng.randi_range(0, cards.size() - 1)].instantiate()
		%EnemyDeck.add_child(enemy_player_card)

func get_cards_from_server():
	pass
