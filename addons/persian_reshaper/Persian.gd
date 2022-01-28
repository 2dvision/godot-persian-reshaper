"""
https://en.wikipedia.org/wiki/Persian_alphabet

letters and replacements format:
{ "letter": [ "isolated", "initial", "medial", "final" ] }
"""
extends Node
class_name Persian


enum {
	NOT_SUPPORTED = -1,
	ISOLATED,
	INITIAL,
	MEDIAL,
	FINAL
}

const LETTERS := {
	# alef
	"آ" : ["ﺁ", "", "", "ﺂ"],
	"ا" : ["ﺍ", "", "", "ﺎ"],
	# be
	"ب" : ["ﺏ", "ﺑ", "ﺒ", "ﺐ"],
	# pe
	"پ" : ["ﭖ", "ﭘ", "ﭙ", "ﭗ"],
	# te
	"ت" : ["ﺕ", "ﺗ", "ﺘ", "ﺖ"],
	# se
	"ث" : ["ﺙ", "ﺛ", "ﺜ", "ﺚ"],
	# jim
	"ج" : ["ﺝ", "ﺟ", "ﺠ", "ﺞ"],
	# che
	"چ" : ["ﭺ", "ﭼ", "ﭽ", "ﭻ"],
	# he jimi
	"ح" : ["ﺡ", "ﺣ", "ﺤ", "ﺢ"],
	# khe
	"خ" : ["ﺥ", "ﺧ", "ﺨ", "ﺦ"],
	# dal
	"د" : ["ﺩ", "", "", "ﺪ"],
	# zal
	"ذ" : ["ﺫ", "", "", "ﺬ"],
	# re
	"ر" : ["ﺭ", "", "", "ﺮ"],
	# ze
	"ز" : ["ﺯ", "", "", "ﺰ"],
	# je
	"ژ" : ["ﮊ", "", "", "ﮋ"],
	# sin
	"س" : ["ﺱ", "ﺳ", "ﺴ", "ﺲ"],
	# shin
	"ش" : ["ﺵ", "ﺷ", "ﺸ", "ﺶ"],
	# sad
	"ص" : ["ﺹ", "ﺻ", "ﺼ", "ﺺ"],
	# zad
	"ض" : ["ﺽ", "ﺿ", "ﻀ", "ﺾ"],
	# ta
	"ط" : ["ﻁ", "ﻃ", "ﻄ", "ﻂ"],
	# za
	"ظ" : ["ﻅ", "ﻇ", "ﻈ", "ﻆ"],
	# ayn
	"ع" : ["ﻉ", "ﻋ", "ﻌ", "ﻊ"],
	# gayn
	"غ" : ["ﻍ", "ﻏ", "ﻐ", "ﻎ"],
	# fa
	"ف" : ["ﻑ", "ﻓ", "ﻔ", "ﻒ"],
	# qaf
	"ق" : ["ﻕ", "ﻗ", "ﻘ", "ﻖ"],
	# kaf
	"ک" : ["ﮎ", "ﮐ", "ﮑ", "ﮏ"],
	# gaf
	"گ" : ["ﮒ", "ﮔ", "ﮕ", "ﮓ"],
	# lam
	"ل" : ["ﻝ", "ﻟ", "ﻠ", "ﻞ"],
	# la
	"ﻻ" : ["ﻻ", "", "", "ﻼ"],
	# mim
	"م" : ["ﻡ", "ﻣ", "ﻤ", "ﻢ"],
	# nun
	"ن" : ["ﻥ", "ﻧ", "ﻨ", "ﻦ"],
	# vav
	"و" : ["ﻭ", "", "", "ﻮ"],
	# he
	"ه" : ["ﻩ", "ﻫ", "ﻬ", "ﻪ"],
	# ye
	"ی" : ["ﯼ", "ﯾ", "ﯿ", "ﯽ"],
	# hamzeh
	"أ" : ["ﺃ", "", "", "ﺄ"],
	"ؤ" : ["ﺅ", "", "", "ﺆ"],
	"ئ" : ["ﺉ", "ﺋ", "ﺌ", "ﺊ"],
	"ء" : ["ﺀ", "", "", ""],
}
const BRACKETS := [
	["(", ")"], ["«", "»"], ["{", "}"], ["[", "]"], ["<", ">"]
]


static func reshaper(string: String, line_length: int = 0) -> String:
	if string.empty():
		return ""
	string = wrap(string, line_length)
	string = reshape(string)
	string = invert(string)
	return string


static func invert(string: String) -> String:
	string = invert_brackets(string)
	string = invert_numbers(string)
	string = invert_letters(string)
	return string


# TODO: reverse non-Persian words
static func invert_non_persian_words(string: String) -> String:
	return string


static func invert_brackets(string: String) -> String:
	for letter in string.length():
		for bracket in BRACKETS:
			if bracket.has(string[letter]):
				string[letter] = bracket[ int(bracket.find(string[letter]) == 0) ]
	return string


static func invert_numbers(string: String) -> String:
	var regex = RegEx.new()
	regex.compile("([0-9۰-۹])+")
	var result: Array = regex.search_all(string)
	if result:
		for i in result:
			var num: String = i.get_string()
			var reverse_num: String = invert_letters(num)
			string = string.replace(num, reverse_num)
	return string


static func invert_letters(string: String) -> String:
	var strg := ""
	for letter in string:
		strg = letter + strg
	return strg


static func reshape(string: String) -> String:
	string = string.replace("لا", "ﻻ")

	for letter in string.length():
		if LETTERS.keys().has(string[letter]):
			var replacement: Array = LETTERS.get(string[letter])
			# first letter
			if previous(letter, string) == NOT_SUPPORTED:
				if next(letter, string) == NOT_SUPPORTED:
					string[letter] = replacement[ISOLATED]
				else:
					if replacement[INITIAL] == "":
						string[letter] = replacement[ISOLATED]
					else:
						string[letter] = replacement[INITIAL]
			# last letter
			elif next(letter, string) == NOT_SUPPORTED:
				if previous(letter, string) == ISOLATED or previous(letter, string) == FINAL:
					string[letter] = replacement[ISOLATED]
				else:
					string[letter] = replacement[FINAL]
			# middle letter
			else:
				if previous(letter, string) == ISOLATED:
					if replacement[INITIAL] == "":
						string[letter] = replacement[ISOLATED]
					else:
						string[letter] = replacement[INITIAL]
				elif previous(letter, string) == INITIAL:
					if replacement[INITIAL] == "" or replacement[MEDIAL] == "":
						string[letter] = replacement[FINAL]
					else:
						string[letter] = replacement[MEDIAL]
				elif previous(letter, string) == MEDIAL:
					if next(letter, string) == NOT_SUPPORTED:
						string[letter] = replacement[FINAL]
					else:
						if replacement[MEDIAL] == "":
							string[letter] = replacement[FINAL]
						else:
							string[letter] = replacement[MEDIAL]
				else:
					if replacement[INITIAL] == "":
						string[letter] = replacement[ISOLATED]
					else:
						string[letter] = replacement[INITIAL]
	return string


static func previous(letter: int, string: String) -> int:
	if letter - 1 < 0:
		return NOT_SUPPORTED
	else:
		var previous := string[letter - 1]
		if LETTERS.keys().has(previous):
			for replacement in LETTERS.get(previous):
				return LETTERS.get(previous).find(replacement)
		else:
			for replacement in LETTERS.values():
				if replacement.has(previous):
					return replacement.find(previous)
	return NOT_SUPPORTED


static func next(letter: int, string: String) -> int:
	if letter + 1 > string.length() - 1:
		return NOT_SUPPORTED
	else:
		var next := string[letter + 1]
		if LETTERS.keys().has(next):
			for replacement in LETTERS.get(next):
				return LETTERS.get(next).find(replacement)
	return NOT_SUPPORTED


static func wrap(string: String, line_length: int = 0) -> String:
	if line_length <= 0:
		return string
	var regex = RegEx.new()
	regex.compile("(.{1," + str(line_length) + "})( +|$)")
	var result: Array = regex.search_all(string)
	if result:
		string = ""
		result.invert()
		for sentence in result:
			string += sentence.get_string()
			if sentence != result[ result.size() - 1 ]:
				string += "\n"
	return string
