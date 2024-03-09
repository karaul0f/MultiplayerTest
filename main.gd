extends Node

@export var battle : PackedScene

func _on_host_button_pressed():
	upnp_setup()
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(9999)
	multiplayer.multiplayer_peer = peer
	
	load_game()
	
func _on_join_button_pressed():
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(%ConnectionIP.text, 9999)
	multiplayer.multiplayer_peer = peer
	
	multiplayer.connected_to_server.connect(load_game)

func load_game():
	%Menu.hide()
	%BattleInstance.add_child(battle.instantiate())
	
# Set up port mapping for online multiplayer functionality
func upnp_setup():
	var upnp = UPNP.new()
	upnp.discover()
	upnp.add_port_mapping(9999)
