//
// Given an array of integers, return indices of the two numbers such that they
// add up to a specific target.
// 
// You may assume that each input would have exactly one solution, and you may not
// use the same element twice.
//
// Example:
//
// Given nums = [2, 7, 11, 15], target = 9,
//
// Because nums[0] + nums[1] = 2 + 7 = 9,
//
// return [0, 1].
//

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var result: [Int] = [-1, -1] // initialize result array with no match answer
    var found: Bool = false
    let numsSize = nums.count
    
    var i = 0 // initialize index to 0
    
    while i < nums.count {
        result[0] = i // assume current index is result
        
        var j = i + 1 // assign next index to j
        
        while j < numsSize { // iterate from j to last element in the array
            if nums[i] + nums[j] == target {
                result[1] = j
                
                found = true
                
                return result
            }
            
            // not possibel to find match with current j, so move to next
            j += 1
        }
        
        // not possible to find match with current i, so move to next
        i += 1
    }
    
    // not able to find any match
    if !found {
        result = [-1, -1] // No match
    }
    
    return result
}

print(twoSum([9, 3, 1, -10, -2], 4))
print(twoSum([3, 3], 6))
