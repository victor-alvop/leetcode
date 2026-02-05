def minSubArrayLen(target, nums):
    start_idx = 0
    end_idx = 0
    current_sum = 0
    min_len = float('inf')

    for end_idx in range(len(nums)):
        current_sum += nums[end_idx]
        while current_sum >= target:
            min_len = min(min_len, end_idx - start_idx + 1)
            current_sum -= nums[start_idx]
            start_idx += 1

    return 0 if min_len == float('inf') else min_len


#test values
nums_1 = [1,2,3,4,5]
target_1 = 11
nums_2 = [1,4,4]
target_2 = 4 

#test cases
test_case_1 = minSubArrayLen(target_1, nums_1)
test_case_2 = minSubArrayLen(target_2, nums_2)
print("\nTestcase 1: ", test_case_1)
print("Testcase 2: ", test_case_2)