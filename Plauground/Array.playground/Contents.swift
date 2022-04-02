import UIKit

let str: String = "fffh"
let setstr = Set(str)

for i in setstr {
    print(i)
}


let array = ["a", "b", "b", "c", "d"]

// поиск индекса
let a = array.firstIndex(of: "b")
// поиск значения по индексу
let b = array[2]

var dictionary = ["a": 1, "b": 2, "c": 3, "d": 4]

// поиск по ключу в словаре
let key = dictionary["a"]

var arr: [Int] = []

for i in dictionary.values {
    arr.append(i)
}

print(arr)

// LeetCode 1920

class Solution1920 {
    static func buildArray(_ nums: [Int]) -> [Int] {
        var array: [Int] = []
        
        for num in 0..<nums.count {
            array.append(nums[nums[num]])
        }
        return array
    }
}

// LeetCode 1929

class Solution1929 {
    static func getConcatenation(_ nums: [Int]) -> [Int] {
        var array: [Int] = []
        for _ in 1...2 {
            for num in 0..<nums.count {
                array.append(nums[num])
            }
        }
        return array
    }
}

// Leetcode 2011

class Solution2011 {
    static func finalValueAfterOperations(_ operations: [String]) -> Int {
        var x = 0
        for i in 0..<operations.count {
            if operations[i] == "X++" || operations[i] == "++X" {
                x += 1
            } else if operations[i] == "X--" || operations[i] == "--X" {
                x -= 1
            }
        }
        return x
    }
}

// LeetCode 1480

class Solution1480 {
    static func runningSum(_ nums: [Int]) -> [Int] {
        var result: [Int] = [nums[0]]
        
        for i in 1..<nums.count {
            result.append(result[i - 1] + nums[i])
        }
        
        return result
    }
}

// LeetCode 1108

class Solution1108 {
    static func defangIPaddr(_ address: String) -> String {
        address.replacingOccurrences(of: ".", with: "[.]")
    }
}

