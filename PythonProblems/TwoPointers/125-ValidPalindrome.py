def isPalindrome(s):
    clean_string = ""
    for char in s:
        if char.isalnum():
            clean_string += char.lower()
    
    left_iterator = 0
    right_iterator = len(clean_string) - 1

    while left_iterator < right_iterator:
        if clean_string[left_iterator] != clean_string[right_iterator]:
            return False
        left_iterator += 1
        right_iterator -= 1
    return True

# test cases
test_string_1 = "A man, a plan, a canal: Panama"
test_string_2 = "race a car"
test_string_3 = "0P"

# function
test_case_1 = isPalindrome(test_string_1)
test_case_2 = isPalindrome(test_string_2)
test_case_3 = isPalindrome(test_string_3)

print(test_case_1)
print(test_case_2)
print(test_case_3)
