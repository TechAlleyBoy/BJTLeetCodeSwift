//
//  数学.swift
//  BJTLeetCodeSwift
//
//  Created by 毕杰涛 on 2020/10/12.
//  Copyright © 2020 毕杰涛. All rights reserved.
//

import Foundation
/*
给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。

示例 1:

输入: 123
输出: 321
 示例 2:

输入: -123
输出: -321
示例 3:

输入: 120
输出: 21
注意:

假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−231,  231 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。
*/
// MARK: LeetCode7. 整数反转
func reverse(_ x: Int) -> Int {
    var num = x
    var outNum = 0
    while num != 0 {
        let temp = num%10
        outNum = outNum * 10 + temp
        num = num/10
    }
    if outNum  > Int32.max || outNum < Int32.min {
        return 0
    }
    return outNum
}

/*
判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

示例 1:

输入: 121
输出: true
示例 2:

输入: -121
输出: false
解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
示例 3:

输入: 10
输出: false
解释: 从右向左读, 为 01 。因此它不是一个回文数。
*/
// MARK: LeetCode9. 回文数
func isPalindrome(_ x: Int) -> Bool {
    if x < 0 {
        return false
    }
    
    var num = x
    var outNum = 0
    while num != 0 {
        let temp = num%10
        outNum = outNum * 10 + temp
        num = num/10
    }
    if x == outNum {
        return true
    }else {
        return false
    }
}
