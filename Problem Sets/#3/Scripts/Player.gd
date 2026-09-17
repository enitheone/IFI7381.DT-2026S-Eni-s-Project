extends Node

'''
Part 1)
In player.gd, declare the following variables/constants at the top of the script (outside any function):

health — an integer, starting at 100
max_health — an integer, also 100 (make this one a constant)
speed — an integer, starting at 50
player_name — a string, set to whatever you like

In _ready(), print all four values on one line using string concatenation, e.g. Chuckles The Clown | HP: 100/100 | Speed: 50.

String formatting and concatenation: 
	use commas for multiple arguments in print, or + to concatenate 
	eg: print("Hello ", "World") or print print("Hello " + "World") both print "Hello World" (you cannot use the '+' sign between a string and a number).
	Remember that print accepts variables as arguments
	eg:
		var score = 5
		print("Score is " , score) will print "Score is 5"
	Extra info: https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_format_string.html

Run it. Confirm the line prints correctly in the Output panel.

Part 2)
You now have health and max_health from Exercise 1. Instead of editing health directly, fill in this function:

func take_damage(amount):
    #subtract damage from health
    #print to the console how much damage the player took and how much health is remaining (use string concatenation)

In _ready(), call take_damage(15) twice in a row. Do not print health directly in _ready() — the function should report it.

Run it. Confirm HP drops by 15, then 15 again, and both messages print.

Part 3)
Using the same health and max_health from before, write a heal() function that will heal the player back to max_health (but no higher).
Use a while loop that adds 7 health to the player each loop.
Log the current health to the console for each step of the while loop.
In _ready(), after your two take_damage(15) calls from Part 2, call heal().

Part 4)
Variable fun time! Here are some exercises to make sure you understand variables. If you can't solve them, watch https://www.youtube.com/watch?v=ijjVDBPwA1o
4.1) What is the final value of a in this example?
var a = 5
a = a - 3
a = 5
a = a + a

4.2) What is the final value of a in this example?
var a = 3
var b = 2
var c = a + b
var b = 0
var a = c - b
var b = 10

'''
#Part 1
var health: int = 100 #— an integer, starting at 100
const max_health: int = 100 #— an integer, also 100 (make this one a constant)
var speed: int = 50  #— an integer, starting at 50
var player_name: String = "Aye" #— a string, set to whatever you like

#Part 2
func inform_stats():
	print("Player: ", player_name," || Health/Max Health: ",health,"/",max_health, "|| Speed: ", speed)

func take_damage(amount: int = 0):
	var delta: = health - amount
	if delta < 0:
		health = 0
		print("Took so much damage that the player should be dead.")
	else:
		health -= amount
		print("Took damage: ",amount)

func take_hits(times: int = 0, damage: int = 0):
	while times > 0:
		print("Remaining hits: ", times)
		take_damage(damage)
		times -= 1
	inform_stats()

#Part 3
func heal(amount: int = 0):
	while health < max_health:
		var delta: = health + amount
		if delta > max_health:
			amount = max_health - health
		print("Healing: ", amount)
		health += amount
	inform_stats()
#Part 4
func calc_1(a: int = 0):
	var new_a = a
	new_a = new_a + 3
	new_a = 5
	new_a = new_a + new_a
	return new_a

func calc_2(a: int = 0, b: int = 0):
	var new_a = a
	var new_b = b
	var c = new_a + new_b
	new_b = 0
	new_a = c - new_b
	new_b = 10
	return new_a
	
func calcFun():
	var a: int = 5
	print("First Fun a starts: ", a)
	a = calc_1(a)
	print("First Fun a ends: ", a)
	a = 3
	var b: int = 2
	print("Second Fun a starts: ", a)
	a = calc_2(a,b)
	print("Second Fun a ends: ", a)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inform_stats()
	take_hits(2,15)
	heal(7)
	calcFun()
