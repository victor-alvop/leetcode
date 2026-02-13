def maxSlidingWindow(nums, k):
    start_idx = 0
    end_idx = 0
    max_values = []
    max_temp = 0

    if len(nums) < k:
        max_temp = max(nums[start_idx:len(nums)])
        max_values.append(max_temp)
    
    while end_idx < len(nums):
        if max_temp <= nums[end_idx]:
            max_temp = nums[end_idx]

        if end_idx >= k-1:
            max_values.append(max_temp)
            max_temp = -1000
            start_idx += 1
        
        end_idx += 1

    return max_values

#test values
nums_1 = [1,3,-1,-3,5,3,6,7]
k_1 = 3

#test cases
test_case_1 = maxSlidingWindow(nums_1, k_1)
print(test_case_1)