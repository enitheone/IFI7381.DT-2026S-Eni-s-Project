extends Node

# Write a for loop using range() that prints the numbers 1 through 10 (inclusive).
func print_numbers_FOR():
	for i in range(10): #ENI Note: research what the function range does
		var current_number: int = i + 1
		print(current_number)
#rewrite it as a while loop
func print_numbers_WHILE():
	var current_number: int = 1
	while current_number < 11:
		print(current_number)
		current_number += 1
 
#Given an array scores = [10, 9, 7, 10, 6], write a for loop that calculates and prints the total sum.
func print_sum(int_array: Array[int] = [10, 9, 7, 10, 6]):
	var array_size: int = int_array.size()
	if array_size == 0:
		print("Your int_array was empty.")
		return
	var calculated_sum: int = 0
	for i in array_size:
		if int_array[i] == null: #ENi Note: research how to make a failsafe whenever I accidentally try to access the index that is not in the array
			print("You did it again. Somehow you went beyond the array.")
			break
		calculated_sum += int_array[i]
	print(calculated_sum)
