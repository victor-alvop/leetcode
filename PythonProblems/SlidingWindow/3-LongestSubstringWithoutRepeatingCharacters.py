def lengthOfLongestSubstring(s):
    if len(s) == 0:
        return 0
    
    start_idx = 0
    end_idx = 0
    string = set()
    longest_substring = 0

    while end_idx < len(s):
        if s[end_idx] not in string:
            string.add(s[end_idx])
            end_idx+=1
            if len(string) > longest_substring:
                longest_substring = len(string)
        else:
            string.remove(s[start_idx])
            start_idx+=1
    
    return longest_substring


#test values
test_value_1 = "abcabcbb"
test_value_2 = "bbbbb"
test_value_3 = " "

#test cases
test_case_1 = lengthOfLongestSubstring(test_value_1)
test_case_2 = lengthOfLongestSubstring(test_value_2)
test_case_3 = lengthOfLongestSubstring(test_value_3)
print(test_case_1)
print(test_case_2)
print(test_case_3)