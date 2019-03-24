extends Node


var text : = 'لورم ایپسوم یا طرح‌نما به متنی آزمایشی و بی‌معنی در صنعت چاپ، صفحه‌آرایی و طراحی گرافیک گفته می‌شود.'
#var text : = 'پارسی شکر است.'


func _ready() -> void:
	$Label.text = text
	$Label2.text = Persian.reverse(text)
	$Label3.text = Persian.reshaper(text, false, 0)
	$Label4.text = Persian.reverse(Persian.reshape(text))
	$Label5.text = Persian.reshaper(text, true, Persian.line_length($Label5))
