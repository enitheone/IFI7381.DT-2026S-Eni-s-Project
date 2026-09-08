extends Node

#region Instructions
'''
Instructions: Assume all code runs inside a Godot Node script unless stated otherwise. 
Use correct GDScript syntax (indentation matters — GDScript uses tabs/spaces).

Quick Reference
Variable:
var health = 100
var speed: float = 250.0

Function:
func take_damage(amount):
health -= amount
return health

For loop
for i in range(5):
print(i)
for enemy in enemies:
enemy.speed += 10
'''
#endregion

#Declare a variable named player_name and assign it a name of your choice as value
var player_name: String = "Apina"

#Declare a variable max_health with an explicit type annotation of int, set to 100.
var max_health: int = 100

#Declare a variable is_alive as a boolean, set to true.
var is_alive: bool = true

#What is the difference between var speed = 5 and const SPEED = 5? When would you use each in a game? Answer as a comment
#region Answer
'''
Winging the answer how I remember, I verify it later when I have time.

Both var speed and const SPEED are declared as variables.
Their main difference relies in the way how the code/engine/compliler considers them.
var speed is declared as a variable that can change during the execution of the code.
const SPEED is declared as a solid variable, a constant, which remains the same throughout the execution.
A const would be used to control, calibrate or pivot the code, because its value does not change after it has been declared.
A var would be used in more flexibile and dynamic ways, since its value changes depending on the circumstances.

Using the var speed and const SPEED as an example, I would use:
	const SPEED to control the max speed that any entity in the game could potentially achieve.
	var speed as a variable for the entity to control their current speed
'''
#endregion
