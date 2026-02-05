def checkInclusion(s1, s2):
    start_idx = 0
    end_idx = 0
    window_size = len(s1)
    s1_count = {}
    s2_count = {}

    for char in s1:
        if char not in s1_count:
            s1_count[char] = 1
        else:
            s1_count[char] += 1
    
    while end_idx < len(s2):
        if end_idx >= len(s1):
            s2_count[s2[start_idx]] -= 1
            if s2_count[s2[start_idx]]== 0:
                s2_count.pop(s2[start_idx])
            start_idx += 1
        if s2[end_idx] not in s2_count:
            s2_count[s2[end_idx]] = 1
        else:
            s2_count[s2[end_idx]] += 1
        if s2_count == s1_count:
            return True
        end_idx += 1
        print("S1 -> ", s1_count)
        print("S2 -> ", s2_count)
    return False


#test values
test1_s1 = "ab"
test1_s2 = "eidbaooo"
test2_s1 = "hello"
test2_s2 = "ooolleoooleh"

#test cases
test_case_1 = checkInclusion(test1_s1, test1_s2)
#test_case_2 = checkInclusion(test2_s1, test2_s2)
print("test case 1: ", test_case_1)
#print("test case 2: ", test_case_2)
