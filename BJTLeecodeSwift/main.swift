//
//  main.swift
//  BJTLeecodeSwift
//
//  Created by 毕杰涛 on 2020/8/4.
//  Copyright © 2020 毕杰涛. All rights reserved.
//

import Foundation

/*
/*---------------🇨🇳哈希表🇨🇳------------------*/
//给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
print("%@",twoSum([2, 7, 11, 15], 9))

//找出数组中重复的数字。
print("%d",findRepeatNumber([2, 3, 1, 0, 2, 5, 3]))

//给定一个包含大写字母和小写字母的字符串，找到通过这些字母构造成的最长的回文串。
print("%d",longestPalindrome("abccccdd"))

//给定两个数组，编写一个函数来计算它们的交集。
print("%@",intersection([1,2,2,1], [2,2]))
print("%@",intersection([4,9,5], [9,4,9,8,4]))

/*---------------🇨🇳递归🇨🇳------------------*/
print("%d",fib(6))


let node1 = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)
let node5 = ListNode(5)
node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
reverseList(node1)
*/

let queue: CQueue = CQueue()
queue.appendTail(1)
queue.appendTail(2)
queue.appendTail(3)
queue.appendTail(4)
queue.appendTail(5)

print(queue.deleteHead())
print(queue.deleteHead())
queue.appendTail(6)
queue.appendTail(7)
print(queue.deleteHead())
print(queue.deleteHead())
print(queue.deleteHead())
print(queue.deleteHead())
print(queue.deleteHead())
print(queue.deleteHead())
print(queue.deleteHead())
queue.appendTail(8)
queue.appendTail(9)
