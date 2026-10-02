extends Node

#1) Declare an array of strings with 5 names in it
var test_array: = ["name 1","name 2","name 3", "name 4", "name 5"]
#2) Write a function that prints the names in order using a for loop and call it from _ready
func print_array(array = []):
	print("Printing the array")
	for i in array.size():
		print(array[i])

#3) Write a function that takes in an array as an argument and swaps the fist value with the last one.
func swap_items(array = [], id_1 = 0, id_2 = 1):
	if array.size() <= 1:
		return
	var temp_item = array[id_1]
	array[id_1] = array[id_2]
	array[id_2] = temp_item
	
func _ready() -> void:
	print_array(test_array)
	swap_items(test_array,4,1)
	print_array(test_array)
	swap_items(test_array,1,3)
	print_array(test_array)
	swap_items(test_array,2,0)
	print_array(test_array)
