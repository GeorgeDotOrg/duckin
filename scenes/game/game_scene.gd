extends Node2D

var RECRUIT = preload("res://scenes/recruit_phase/Recruit_Scene.tscn")
var ATTACK = preload("res://scenes/attack_phase/Attack_Scene.tscn")

var recruit_name = "RecruitScene"
var attack_name = "Node2D"

func _ready():
	pass

func change_scenes():
	var curr = get_child(0)
	var player = get_player(curr)
	var player_data = {"Food": player.food_count, "Money": player.money, "Ducks": player.duck_count, "Inventory": player.duck_inventory}
	
	var scene = curr
	if curr.name == attack_name:
		scene = RECRUIT.instance()
		print("Recruit")
	elif curr.name == recruit_name:
		scene = ATTACK.instance()
		print("Attack")
		
	var is_attack_scene = curr.name == recruit_name
	
	remove_child(curr)
	player = get_player(scene)
	
	player.is_attacking = is_attack_scene
	
	player.food_count = player_data["Food"]
	player.money = player_data["Money"]
	player.duck_count = player_data["Ducks"]
	player.duck_inventory = player_data["Inventory"]
	add_child(scene)

func get_player(phase):
	var player = null
	for child in phase.get_children():
		if child.name == "player":
			player = child
	return player
