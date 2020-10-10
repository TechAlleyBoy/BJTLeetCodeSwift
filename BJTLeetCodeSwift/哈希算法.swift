//
//  Leecode-1.swift
//  BJTLeecodeSwift
//
//  Created by 毕杰涛 on 2020/8/4.
//  Copyright © 2020 毕杰涛. All rights reserved.
//

import Foundation

/*
给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。

 

示例:

给定 nums = [2, 7, 11, 15], target = 9

因为 nums[0] + nums[1] = 2 + 7 = 9
所以返回 [0, 1]
*/
// MARK: 1. 两数之和
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var numsDic:[Int:[Int]] = [:]
    for i in 0...nums.count-1
    {
        if (numsDic[nums[i]] != nil) {
            var numsAry:[Int] = numsDic[nums[i]]!
            numsAry.append(i)
            numsDic[nums[i]] = numsAry
        }else {
            let numsAry:[Int] = [i]
            numsDic[nums[i]] = numsAry
        }
    }
    
   for i in 0...nums.count-1 {
        let first = nums[i];
        let second = target - first;
        if first==second && numsDic[second]!.count > 1 {
            return[i,numsDic[second]![1]];
        }
        if (first != second && numsDic[second] != nil){
            return[i,numsDic[second]![0]];
        }
    }
    return [];
}




/*
找出数组中重复的数字。


在一个长度为 n 的数组 nums 里的所有数字都在 0～n-1 的范围内。数组中某些数字是重复的，但不知道有几个数字重复了，也不知道每个数字重复了几次。请找出数组中任意一个重复的数字。

示例 1：

输入：
[2, 3, 1, 0, 2, 5, 3]
输出：2 或 3
*/
// MARK: 剑指 Offer 03 数组中重复的数字
func findRepeatNumber(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return -1;
    }
    var map:[Int:Int] = [:]
    for num in nums {
        if map[num] == nil {
            map[num] = 1;
        }else {
            map[num] = map[num]! + 1;
            return num;
        }
    }
    return -1;
}


/*
给定一个包含大写字母和小写字母的字符串，找到通过这些字母构造成的最长的回文串。

在构造过程中，请注意区分大小写。比如 "Aa" 不能当做一个回文字符串。

注意:
假设字符串的长度不会超过 1010。

示例 1:

输入:
"abccccdd"

输出:
7

解释:
我们可以构造的最长的回文串是"dccaccd", 它的长度是 7。
*/

// MARK: 409 最长回文串
func longestPalindrome(_ s: String) -> Int {
    if s.isEmpty {
      return 0
    }
    
    var map:[Character:Int] = [:]
    
    
    for cha in s {
        if map[cha] == nil {
            map[cha]=1
        }else {
            map[cha]! += 1
        }
    }
    var length = 0
    for value in map {
        length += (value.value/2)*2
        if length%2 == 0 && value.value%2>0 {
          length += 1
        }
    }
    return length
}



/*
给定两个数组，编写一个函数来计算它们的交集。

示例 1：
输入：nums1 = [1,2,2,1], nums2 = [2,2]
输出：[2]
 
示例 2：
输入：nums1 = [4,9,5], nums2 = [9,4,9,8,4]
输出：[9,4]

说明：

输出结果中的每个元素一定是唯一的。
我们可以不考虑输出结果的顺序。
*/
// MARK: 349 两个数组的交集
func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    if nums1.count == 0 || nums2.count == 0 {
        return[]
    }
    var map1:[Int:Int] = [:]
    for num in nums1 {
        if map1[num] == nil {
            map1[num] = 1;
        }else {
            map1[num]! += 1;
        }
    }
    
    var tmpNum:Array = Array<Int>()
    for num in nums2 {
        if map1[num] != nil {
            tmpNum.append(num);
        }
    }
    var map2:[Int:Int] = [:]
    var numAry:Array = Array<Int>()
    for num in tmpNum {
        if map2[num] == nil {
            map2[num] = 1;
            numAry.append(num);
        }
    }
    
    return numAry;
}

/*
给你一个整数数组 nums 。

如果一组数字 (i,j) 满足 nums[i] == nums[j] 且 i < j ，就可以认为这是一组 好数对 。

返回好数对的数目。

 

示例 1：

输入：nums = [1,2,3,1,1,3]
输出：4
解释：有 4 组好数对，分别是 (0,3), (0,4), (3,4), (2,5) ，下标从 0 开始
示例 2：

输入：nums = [1,1,1,1]
输出：6
解释：数组中的每组数字都是好数对
示例 3：

输入：nums = [1,2,3]
输出：0
 

提示：

1 <= nums.length <= 100
1 <= nums[i] <= 100
*/

// MARK: 1512. 好数对的数目
func numIdenticalPairs(_ nums: [Int]) -> Int {
    var map : [Int : Int] = [:]
    
    for num in nums {
        if map[num] != nil{
            map[num]! += 1;
        }else {
            map[num] = 1
        }
    }
    
    var numSize = 0
    for  mapV in map {
        let value = mapV.value
        if value > 1 {
            numSize += (value * (value-1))/2
        }
    }
    return numSize;
}
/*
给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。

示例：

s = "leetcode"
返回 0

s = "loveleetcode"
返回 2
*/

// MARK: 387. 字符串中的第一个唯一字符
func firstUniqChar(_ s: String) -> Int {
    if s.isEmpty {
        return -1
    }
    var map: [Character:Int] = [:]
    
    for char in s {
        if map[char] == nil {
            map[char] = 1
        }else {
            map[char]! += 1
        }
    }
    var index = 0
    for char in s {
        if map[char] == 1 {
            return index
        }
        index += 1
    }
    return -1
}



/*
给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

说明：

你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？

示例 1:

输入: [2,2,1]
输出: 1
示例 2:

输入: [4,1,2,1,2]
输出: 4
*/
// MARK: 136. 只出现一次的数字

func singleNumber(_ nums: [Int]) -> Int {
    var map: [Int:Int] = [:]
    
    for num in nums {
        if map[num] == nil {
            map[num] = 1
        }else {
            map[num]! += 1
        }
    }
    
    for num in nums {
        if map[num] == 1 {
            return num
        }
    }
    return -999
}
