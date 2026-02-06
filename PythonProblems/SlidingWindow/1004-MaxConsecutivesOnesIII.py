def longestOnes(nums, k):
    start_idx = 0
    end_idx = 0
    current_flips = k
    max_consecutive = 0

    print(" innit start", start_idx, "- end", end_idx)

    while start_idx < len(nums):
        
        if end_idx == len(nums):
            print("a")
            end_idx = start_idx 
        
        print("number: ",nums[end_idx])
        print("start", start_idx, "- end", end_idx)
        
        if nums[end_idx] == 1:
            print("b")
            end_idx += 1
        else:
            if current_flips == 0:
                print("c")
                current_flips = k
                max_consecutive = max(max_consecutive, (end_idx - start_idx))
                start_idx += 1
                end_idx = start_idx
            else: 
                print("d")
                end_idx += 1
                current_flips -= 1
            
    return max_consecutive



test_case_2 = longestOnes([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], 3)
print(test_case_2)
