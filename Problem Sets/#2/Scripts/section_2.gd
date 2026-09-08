extends Node

#Write a function greet() that prints "Hello, adventurer!" to the console.
func greet():
	var greeting_text: String = "Hello, adventurer!"
	print(greeting_text)
	# return #ENi Note: research what returning nothing means in Godot.
#Write a function add_score(points) that takes one parameter and returns the current score plus points.
var score := 5

func add_score(points):
	if points != TYPE_INT:
		print("The provided variable is not a correct type, you beautiful mess of a programmer.")
		return -1 #ENi Note: I have practiced to return -1 as a signal for me to debug faster the issues in functions. My results have varied thus far.
	var new_score: int = score
	new_score += points
	return new_score

#Write a function is_alive(hp) that takes an integer hp and returns true if hp is greater than 0, and false otherwise.
var hp := 80

func is_alive(passed_hp: int = 0): #ENi note: research why Godot provided a warning recarding already declared hp.
	if passed_hp != TYPE_INT:
		print("The value is not an int, aka an accepted value type, so it must be dead. How does it feel to play a God and not to know the rules?")
		return false
	if passed_hp > 0:
		return true
	else:
		return false

#Write a function heal(current_hp, amount, max_hp) that returns the new HP after healing, but never lets it exceed max_hp.
var max_hp := 100

func heal(max_hp, current_hp: int = 0, amount: int = 0): #ENI Note: research the order of mandatory and option parameters in Godot
	var new_hp: = current_hp + amount
	if new_hp > max_hp:
		new_hp = max_hp
	return new_hp

#What keyword built into every Godot Node script runs once when the node enters the scene tree? Write a stub for it that prints a number of your choice.

#How often does the _process() function run?
