//
//  数组.swift
//  BJTLeecodeSwift
//
//  Created by 毕杰涛 on 2020/9/21.
//  Copyright © 2020 毕杰涛. All rights reserved.
//

import Foundation
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

// MARK: 1394 找出数组中的幸运数
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

// 88 合并两个有序数组
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
// MARK: 1470 重新排列数组
func shuffle(_ nums:[Int], _ n:Int) -> [Int] {
    var tmpNums:[Int] = []
    for i in 0...n-1 {
        tmpNums.append(nums[i])
        tmpNums.append(nums[i+n])
    }
    return tmpNums
    
}


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

// MARK: 1486 数组异或操作
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

/*
给你一个数组 nums 。数组「动态和」的计算公式为：runningSum[i] = sum(nums[0]…nums[i]) 。

请返回 nums 的动态和。

 

示例 1：

输入：nums = [1,2,3,4]
输出：[1,3,6,10]
解释：动态和计算过程为 [1, 1+2, 1+2+3, 1+2+3+4] 。
示例 2：

输入：nums = [1,1,1,1,1]
输出：[1,2,3,4,5]
解释：动态和计算过程为 [1, 1+1, 1+1+1, 1+1+1+1, 1+1+1+1+1] 。
示例 3：

输入：nums = [3,1,2,10,1]
输出：[3,4,6,16,17]
 

提示：

1 <= nums.length <= 1000
-10^6 <= nums[i] <= 10^6
*/
// MARK: 1480. 一维数组的动态和
func runningSum(_ nums: [Int]) -> [Int] {
    /*方法1
    var tmpNums: Array = Array<Int>()
    var sum: Int = 0
    
    for item in nums {
        sum += item
        tmpNums.append(sum)
    }
    return tmpNums
     */
    
    var tmpNums = nums
    for i in 1..<nums.count {
        tmpNums[i] += tmpNums[i-1]
    }
    return tmpNums
}

/*
给你一个数组 candies 和一个整数 extraCandies ，其中 candies[i] 代表第 i 个孩子拥有的糖果数目。

对每一个孩子，检查是否存在一种方案，将额外的 extraCandies 个糖果分配给孩子们之后，此孩子有 最多 的糖果。注意，允许有多个孩子同时拥有 最多 的糖果数目。

 

示例 1：

输入：candies = [2,3,5,1,3], extraCandies = 3
输出：[true,true,true,false,true]
解释：
孩子 1 有 2 个糖果，如果他得到所有额外的糖果（3个），那么他总共有 5 个糖果，他将成为拥有最多糖果的孩子。
孩子 2 有 3 个糖果，如果他得到至少 2 个额外糖果，那么他将成为拥有最多糖果的孩子。
孩子 3 有 5 个糖果，他已经是拥有最多糖果的孩子。
孩子 4 有 1 个糖果，即使他得到所有额外的糖果，他也只有 4 个糖果，无法成为拥有糖果最多的孩子。
孩子 5 有 3 个糖果，如果他得到至少 2 个额外糖果，那么他将成为拥有最多糖果的孩子。
示例 2：

输入：candies = [4,2,1,1,2], extraCandies = 1
输出：[true,false,false,false,false]
解释：只有 1 个额外糖果，所以不管额外糖果给谁，只有孩子 1 可以成为拥有糖果最多的孩子。
示例 3：

输入：candies = [12,1,12], extraCandies = 10
输出：[true,false,true]
 

提示：

2 <= candies.length <= 100
1 <= candies[i] <= 100
1 <= extraCandies <= 50

*/
// MARK: 1431. 拥有最多糖果的孩子
func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
    var max = 0
    
    for num in candies {
        if max <= num {
            max = num
        }
    }
    let min = max - extraCandies
    var arr: Array = Array<Bool>()
    
    for num in candies {
        if num < min {
            arr.append(false)
        }else {
            arr.append(true)
        }
    }
    return arr
}
