def trap(height):
    left_index = 0
    left_max = 0
    right_index = len(height) - 1
    right_max = 0
    area = 0

    while left_index < right_index:
        if height[left_index] < height[right_index]:
            print(left_max, " # ", height[left_index])
            if height[left_index] >= left_max:
                left_max = height[left_index]
            else:
                area += left_max - height[left_index]
            left_index += 1
        else:
            print(height[right_index], " $ ",right_max)
            if height[right_index] >= right_max:
                right_max = height[right_index]
            else:
                area += right_max - height[right_index]
            right_index -= 1
    return area

# test values
test_value_1 = [0,1,0,2,1,0,1,3,2,1,2,1]
test_value_2 = [4,2,0,3,2,5]

#test cases
case_1 = trap(test_value_1)
#case_2 = trap(test_value_2)
print(case_1)
#print(case_2)