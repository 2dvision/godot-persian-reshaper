tool
extends VBoxContainer


onready var InputText := $VBoxContainer/VBoxContainer/HBoxContainer/Input
onready var OutputText := $VBoxContainer/VBoxContainer2/HBoxContainer2/Output

onready var btn_reshape := $VBoxContainer/VBoxContainer/Reshape
onready var btn_clean := $VBoxContainer/VBoxContainer/HBoxContainer/Clean
onready var btn_copy := $VBoxContainer/VBoxContainer2/Copy
onready var btn_donate := $VBoxContainer/VBoxContainer2/HBoxContainer2/Donate


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
	OS.shell_open("https://idpay.ir/2dvision")
