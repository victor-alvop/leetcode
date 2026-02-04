def maxProfit(prices):

    if len(prices) <= 1:
        return 0
    
    min_price = 0
    max_price = 1
    max_profit = 0


    
    while max_price <= len(prices)-1:
        #print(prices[min_price], prices[max_price])
        if prices[min_price] > prices[max_price]:
            min_price = max_price
        else:
            profit = prices[max_price] - prices[min_price]
            #print("profit", profit)
            #print("max profit: ",max_profit)
            if profit > max_profit:
                max_profit = profit
            
        max_price += 1
    
    return max_profit


# test values
test_values_1 = [7,1,5,3,6,4]
test_values_2 = [7,6,4,3,1]
test_Values_3 = [1]
test_values_4 = [1,2]
test_values_5 = [2,1,2,1,0,1,2]

# test cases
test_case_1 = maxProfit(test_values_1)
test_case_2 = maxProfit(test_values_2)
test_case_3 = maxProfit(test_Values_3)
test_case_4 = maxProfit(test_values_4)
test_case_5 = maxProfit(test_values_5)
print(test_case_1)
print(test_case_2)
print(test_case_3)
print(test_case_4)
print(test_case_5)