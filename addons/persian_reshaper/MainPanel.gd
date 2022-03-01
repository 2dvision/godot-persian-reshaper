tool
extends VBoxContainer


onready var InputText := $HBoxContainer/Input
onready var OutputText := $HBoxContainer2/Output

onready var btn_reshape := $HBoxContainer/Reshape
onready var btn_clean := $HBoxContainer/Clean
onready var btn_copy := $HBoxContainer2/Copy
onready var btn_donate := $HBoxContainer2/Donate


func _ready() -> void:
	btn_reshape.connect("pressed", self, "_on_Reshape_pressed")
	btn_copy.connect("pressed", self, "_on_Copy_pressed")
	btn_clean.connect("pressed", self, "_on_Clean_pressed")
	btn_donate.connect("pressed", self, "_on_Donate_pressed")


func _on_Reshape_pressed() -> void:
	OutputText.text = Persian.reshaper(InputText.text)


func _on_Clean_pressed() -> void:
	InputText.clear()
	OutputText.clear()


func _on_Copy_pressed() -> void:
	OS.clipboard = OutputText.text


func _on_Donate_pressed() -> void:
	pass
