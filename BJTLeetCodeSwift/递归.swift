//
//  递归.swift
//  BJTLeecodeSwift
//
//  Created by 毕杰涛 on 2020/9/21.
//  Copyright © 2020 毕杰涛. All rights reserved.
//

import Foundation

/*
写一个函数，输入 n ，求斐波那契（Fibonacci）数列的第 n 项。斐波那契数列的定义如下：

F(0) = 0,   F(1) = 1
F(N) = F(N - 1) + F(N - 2), 其中 N > 1.
斐波那契数列由 0 和 1 开始，之后的斐波那契数就是由之前的两数相加而得出。

答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。

示例 1：

输入：n = 2
输出：1
示例 2：

输入：n = 5
输出：5

提示：
0 <= n <= 100
*/

// MARK: 剑指 Offer 10- I 斐波那契数列
let constant = 1000000007

func fib(_ n: Int) -> Int {
    var map:[Int:Int] = [:]
    return fibHash(n, &map)
}

func fibHash(_ n: Int,_ map:inout [Int:Int]) -> Int {
    if n < 2 {
        return n
    }
    
    var first = 0
    var second = 0
    if map[n] != nil {
        return map[n]!
    }
    first = fibHash(n - 1, &map) % constant
    map[n-1] = first
    
    second = fibHash(n - 2, &map) % constant
    map[n-2] = second
    
    let res = (first + second) % constant
    map[n] = res
    return res
}

/*
给定二叉搜索树的根结点 root，返回 L 和 R（含）之间的所有结点的值的和。
二叉搜索树保证具有唯一的值。

示例 1：
输入：root = [10,5,15,3,7,null,18], L = 7, R = 15
输出：32
 
示例 2：
输入：root = [10,5,15,3,7,13,18,1,null,6], L = 6, R = 10
输出：23
 

提示：

树中的结点数量最多为 10000 个。
最终的答案保证小于 2^31。
*/
// MARK: 938 二叉搜索树的范围和
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func rangeSumBST(_ root: TreeNode?, _ L: Int, _ R: Int) -> Int {
    if(root == nil){
        return 0;
    }
    if(root!.val > R){
        return rangeSumBST(root!.left, L, R);
    } else if(root!.val < L){
        return rangeSumBST(root!.right, L, R);
    } else {
        return root!.val + rangeSumBST(root!.left, L, R) + rangeSumBST(root!.right, L, R);
    }
}

/*
一只青蛙一次可以跳上1级台阶，也可以跳上2级台阶。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。

答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。

示例 1：
输入：n = 2
输出：2
 
示例 2：
输入：n = 7
输出：21
 
示例 3：
输入：n = 0
输出：1
提示：

0 <= n <= 100
*/
// MARK: LeetCode70. 爬楼梯 && 剑指 Offer 10- II 青蛙跳台阶问题
func numWays(_ n: Int) -> Int {
    var map:[Int:Int] = [:]
    return numWaysHash(n, &map)
}

func numWaysHash(_ n: Int,_ map:inout [Int:Int]) -> Int {
    if n < 2 {
        return 1
    }
    
    var first = 0
    var second = 0
    if map[n] == nil {
        first = numWaysHash(n - 1, &map) % constant
        second = numWaysHash(n - 2, &map) % constant
        map[n] = (first + second) % constant
        return map[n]!
    }
    return map[n]!
}
