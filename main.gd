extends Node

func _on_host_button_pressed():
	upnp_setup()
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(9999)
	multiplayer.multiplayer_peer = peer
	
	load_game()
	
func load_game():
	%Menu.hide()
	
# Set up port mapping for online multiplayer functionality
func upnp_setup():
	var upnp = UPNP.new()
	upnp.discover()
	upnp.add_port_mapping(9999)
