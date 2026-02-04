def moveZeroes(nums):
    reader_index = 0
    writer_index = 0

    while writer_index <= len(nums)-1:
        if reader_index >len(nums)-1:
            nums[writer_index] = 0
            writer_index+=1
        else:
            if nums[reader_index] != 0:
                nums[writer_index] = nums[reader_index]
                writer_index += 1      
            reader_index += 1
    return nums

# test values
test_values_1 = [0,1,0,3,12]
test_values_2 = [0]

# test cases
test_case_1 = moveZeroes(test_values_1)
test_cases_2 = moveZeroes(test_values_2)
print(test_case_1)
#print(test_cases_2)