extends Node

onready var label : = $Label
onready var label2 : = $Label2
onready var label3 : = $Label3
onready var label4 : = $Label4
onready var label5 : = $Label5

var text : = 'لورم ایپسوم یا طرح‌نما به متنی آزمایشی و بی‌معنی در صنعت چاپ، صفحه‌آرایی و طراحی گرافیک گفته می‌شود.'
#var text : = 'پارسی شکر است.'


func _ready() -> void:
	label.text = text
	label2.text = Persian.reverse(text)
	label3.text = Persian.reshaper(text, false, 0)
	label4.text = Persian.reverse(Persian.reshape(text))
	label5.text = Persian.reshaper(text, true, Persian.line_length(label5))
