def twoSum(values_list, target_value):

    if 2 <= len(values_list) <= 10**4 or -10**9 <= target_value <= 10**9:

        current_value = 0
        next_value = 1
        sum_value = 0
        
        if -10**9 <= values_list[current_value] <= 10**9:
            while current_value <= len(values_list)-1:
                sum_value = values_list[current_value] + values_list[next_value]
                if sum_value == target_value:
                    return [current_value, next_value]
                elif next_value == len(values_list)-1:
                    current_value += 1
                    next_value = current_value + 1
                else:
                    next_value += 1
            return None
        
    else: 
        return None


'''
escenario 1: recorri todo y tengo que mover iterador current
escenario 2: los 
'''

# test cases
test_case_1 = [2,7,11,15]
target_case_1 = 9

test_case_2 = [3,2,4]
target_case_2 = 6

test_case_3 = [3,2,3]
target_case_3 = 6

# result
twosum_result = twoSum(test_case_1, target_case_1)
print(twosum_result)