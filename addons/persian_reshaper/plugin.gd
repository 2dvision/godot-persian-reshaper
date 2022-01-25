tool
extends EditorPlugin


var MainPanel := preload("res://addons/persian_reshaper/MainPanel.tscn")
var panel_instance


func _enter_tree() -> void:
	panel_instance = MainPanel.instance()
	get_editor_interface().get_editor_viewport().add_child(panel_instance)
	make_visible(false)


func _exit_tree() -> void:
	if panel_instance:
		panel_instance.queue_free()


func has_main_screen() -> bool:
	return true


func make_visible(visible: bool) -> void:
	if panel_instance:
		panel_instance.visible = visible


func get_plugin_name() -> String:
	return "ﺲﯾﻮﻧ ﯽﺳﺭﺎﻓ"


func get_plugin_icon() -> Texture:
	return get_editor_interface().get_base_control().get_icon("Label", "EditorIcons")
