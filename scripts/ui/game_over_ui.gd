extends Control

@onready var you_score_label: Label = $"PanelContainer/MarginContainer/VBoxContainer/YouScoreLabel"

func _ready() -> void:
	self.visible = false

func _process(_delta: float) -> void:
	if GameManager.is_game_over:
		self.visible = true
		you_score_label.text = "You score: " + str(GameManager.score)
