extends Node

@onready var player_label = $Label/PlayerScore
@onready var cpu_label = $Label/CPUScore
@onready var ball = $"../Ball"
var playerScore = 0
var cpuScore = 0
var can_score = false

func _ready():
	await get_tree().create_timer(0.2).timeout  # wait 200ms instead of 1 frame
	can_score = true

func playerScored():
	if !can_score:
		return
	playerScore += 1 
	player_label.text = str(playerScore)
	can_score = false
	ball.reset()
	await get_tree().create_timer(0.5).timeout  # brief pause before allowing rescore
	can_score = true
	
func cpuScored():
	if !can_score:
		return
	cpuScore += 1
	cpu_label.text = str(cpuScore)
	can_score = false
	ball.reset()
	await get_tree().create_timer(0.5).timeout
	can_score = true
