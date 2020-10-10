//
//  main.swift
//  BJTLeecodeSwift
//
//  Created by 毕杰涛 on 2020/8/4.
//  Copyright © 2020 毕杰涛. All rights reserved.
//

import Foundation

// MARK: ---------------🇨🇳递归🇨🇳------------------
// MARK: 剑指 Offer 10- I 斐波那契数列
print(fib(6))

// MARK: 938 二叉搜索树的范围和
let treeNode1 = TreeNode(3)
treeNode1.left = TreeNode(1)

let treeNode2 = TreeNode(7)
treeNode2.left = TreeNode(6)

let treeNode3 = TreeNode(15)
treeNode3.left = TreeNode(13)
treeNode3.right = TreeNode(18)

let treeNode4 = TreeNode(5)
treeNode4.left = treeNode1
treeNode4.right = treeNode2

let treeNode = TreeNode(10)
treeNode.left = treeNode4
treeNode.right = treeNode3

print(rangeSumBST(treeNode, 6, 10))

// MARK: LeetCode70. 爬楼梯 && 剑指 Offer 10- II 青蛙跳台阶问题
print(numWays(7))

// MARK: ---------------🇨🇳哈希表🇨🇳------------------
// MARK: 1 两数之和
print(twoSum([2, 7, 11, 15], 9))

// MARK: 剑指 Offer 03 数组中重复的数字
print(findRepeatNumber([2, 3, 1, 0, 2, 5, 3]))

// MARK: 409 最长回文串
print(longestPalindrome("abccccdd"))

// MARK: 349 两个数组的交集
print(intersection([1,2,2,1], [2,2]))
print(intersection([4,9,5], [9,4,9,8,4]))

// MARK: 1512 好数对的数目
print(numIdenticalPairs([1,2,3,1,1,3]))

// MARK: 387. 字符串中的第一个唯一字符
print(firstUniqChar("lovelove"))

// MARK: 136. 只出现一次的数字
print(singleNumber([1,2,2,1,3]))

// MARK: ---------------🇨🇳链表🇨🇳------------------
// MARK: 剑指 Offer 24 反转链表
let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)
let node5 = ListNode(5)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
print(reverseList(node1) as Any)

// MARK: ---------------🇨🇳数组🇨🇳------------------
// MARK: 88 合并两个有序数组
var num1 = [1,2,3,0,0,0]
var num2 = [1,2,3]
merge(&num1, 3, num2, 3)

// MARK: 1394. 找出数组中的幸运数
print(findLucky([2,2,3,4]))

// MARK: 1470 重新排列数组
print(shuffle([2,5,1,3,4,7], 3))

// MARK: 1486 数组异或操作
print(xorOperation(5, 0))

// MARK: ---------------🇨🇳栈🇨🇳------------------

// MARK: 剑指 Offer 09. 用两个栈实现队列
let queue: CQueue = CQueue()
queue.appendTail(1)
queue.appendTail(2)
queue.appendTail(3)

print(queue.deleteHead())
print(queue.deleteHead())
queue.appendTail(4)
print(queue.deleteHead())
print(queue.deleteHead())
print(queue.deleteHead())
queue.appendTail(5)
print(queue.deleteHead())
print(queue.deleteHead())
print(queue.deleteHead())

// MARK: LeetCode1021 删除最外层的括号
print(removeOuterParentheses("(()())(())(()(()))"))
