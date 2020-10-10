//
//  数组.swift
//  BJTLeecodeSwift
//
//  Created by 毕杰涛 on 2020/9/21.
//  Copyright © 2020 毕杰涛. All rights reserved.
//

import Foundation
// MARK: 数组算法1
/*
在整数数组中，如果一个整数的出现频次和它的数值大小相等，我们就称这个整数为「幸运数」。

给你一个整数数组 arr，请你从中找出并返回一个幸运数。

如果数组中存在多个幸运数，只需返回 最大 的那个。
如果数组中不含幸运数，则返回 -1 。
 

示例 1：

输入：arr = [2,2,3,4]
输出：2
解释：数组中唯一的幸运数是 2 ，因为数值 2 的出现频次也是 2 。
示例 2：

输入：arr = [1,2,2,3,3,3]
输出：3
解释：1、2 以及 3 都是幸运数，只需要返回其中最大的 3 。
示例 3：

输入：arr = [2,2,2,3,3]
输出：-1
解释：数组中不存在幸运数。
示例 4：

输入：arr = [5]
输出：-1
示例 5：

输入：arr = [7,7,7,7,7,7,7]
输出：7
 

提示：

1 <= arr.length <= 500
1 <= arr[i] <= 500
*/

func findLucky(_ arr: [Int]) -> Int {
    if arr.count == 0 {
        return -1
    }
    
    var map:[Int:Int] = [:]
    for num in arr {
        if map[num] == nil {
            map[num] = 1
        }else {
            map[num]! += 1
        }
    }
    
    var maxNum = -1
    for value in map {
        if value.key == value.value &&
            maxNum < value.key {
            maxNum = value.key
        }
    }
    return maxNum
}

// MARK: 数组算法2
/*
给你两个有序整数数组 nums1 和 nums2，请你将 nums2 合并到 nums1 中，使 nums1 成为一个有序数组。

说明:

初始化 nums1 和 nums2 的元素数量分别为 m 和 n 。
你可以假设 nums1 有足够的空间（空间大小大于或等于 m + n）来保存 nums2 中的元素。
 
示例:

输入:
nums1 = [1,2,3,0,0,0], m = 3
nums2 = [2,5,6],       n = 3

输出: [1,2,2,3,5,6]
 */
func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    if m==0 {
        nums1 = nums2
    }
    
    var mTmp = 0
    var nTmp = 0
    
    var tmp:[Int] = []
    
    while mTmp<m && nTmp<n {
        if nums1[mTmp] <= nums2[nTmp]  {
            tmp.append(nums1[mTmp])
            mTmp += 1
        }else if nums1[mTmp] > nums2[nTmp]  {
            tmp.append(nums2[nTmp])
            nTmp += 1
        }
    }
    
    while mTmp<m {
        tmp.append(nums1[mTmp])
        mTmp += 1
    }
    
    while nTmp<n {
        tmp.append(nums2[nTmp])
        nTmp += 1
    }
    nums1 = tmp
}

// MARK: 数组算法3
/*
给你一个数组 nums ，数组中有 2n 个元素，按 [x1,x2,...,xn,y1,y2,...,yn] 的格式排列。

请你将数组按 [x1,y1,x2,y2,...,xn,yn] 格式重新排列，返回重排后的数组。

 

示例 1：

输入：nums = [2,5,1,3,4,7], n = 3
输出：[2,3,5,4,1,7]
解释：由于 x1=2, x2=5, x3=1, y1=3, y2=4, y3=7 ，所以答案为 [2,3,5,4,1,7]
示例 2：

输入：nums = [1,2,3,4,4,3,2,1], n = 4
输出：[1,4,2,3,3,2,4,1]
示例 3：

输入：nums = [1,1,2,2], n = 2
输出：[1,2,1,2]
 

提示：

1 <= n <= 500
nums.length == 2n
1 <= nums[i] <= 10^3
*/

func shuffle(_ nums:[Int], _ n:Int) -> [Int] {
    var tmpNums:[Int] = []
    for i in 0...n-1 {
        tmpNums.append(nums[i])
        tmpNums.append(nums[i+n])
    }
    return tmpNums
    
}

// MARK: 数组算法4
/*
给你两个整数，n 和 start 。

数组 nums 定义为：nums[i] = start + 2*i（下标从 0 开始）且 n == nums.length 。

请返回 nums 中所有元素按位异或（XOR）后得到的结果。

 

示例 1：

输入：n = 5, start = 0
输出：8
解释：数组 nums 为 [0, 2, 4, 6, 8]，其中 (0 ^ 2 ^ 4 ^ 6 ^ 8) = 8 。
     "^" 为按位异或 XOR 运算符。

 示例 2：

输入：n = 4, start = 3
输出：8
解释：数组 nums 为 [3, 5, 7, 9]，其中 (3 ^ 5 ^ 7 ^ 9) = 8.

 示例 3：

输入：n = 1, start = 7
输出：7
 
示例 4：

输入：n = 10, start = 5
输出：2
*/

func xorOperation(_ n: Int, _ start: Int) -> Int {
    if n==0 {
        return 0
    }
    var tmp = start
    for i in 1..<n {
       tmp ^= (start + 2*i)
    }
    return tmp
}
