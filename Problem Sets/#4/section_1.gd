extends Node

#1) Declare an array of strings with 5 names in it
var test_array: = ["name 1","name 2","name 3", "name 4", "name 5"]
#2) Write a function that prints the names in order using a for loop and call it from _ready
func print_array(array = []):
	print("Printing the array")
	for i in array.size():
		print(array[i])

#3) Write a function that takes in an array as an argument and swaps the fist value with the last one.
func swap_items(array = [], id_1 = 0, id_2 = array.size()-1):
	if array.size() <= 1:
		return
	var temp_item = array[id_1]
	array[id_1] = array[id_2]
	array[id_2] = temp_item
	
func swap_random(array = []):
	if array.size() <= 1:
		return
	var rand_id_a = int(randi_range(0,array.size() - 1))
	var rand_id_b = 0
	while rand_id_b == rand_id_a:
		rand_id_b = int(randi_range(0,array.size() - 1))
	swap_items(array, rand_id_a, rand_id_b)

func _ready() -> void:
	print_array(test_array)
	swap_items(test_array)
	print_array(test_array)
	swap_random(test_array)
	print_array(test_array)
