def removeDuplicates(nums):

    last_valid_postion = 0
    current_postion = 1

    while current_postion != len(nums):
        if nums[last_valid_postion] != nums[current_postion]:
            last_valid_postion += 1
            nums[last_valid_postion] = nums[current_postion]
        current_postion += 1

    return last_valid_postion+1, nums



# test values
test_values_1 = [1,1,2]
test_values_2 = [0,0,1,1,1,2,2,3,3,4]

# test case
test_case_1 = removeDuplicates(test_values_1)
test_case_2 = removeDuplicates(test_values_2)
print("Test case 1: ", test_case_1)
print("Test case 2: ",test_case_2)