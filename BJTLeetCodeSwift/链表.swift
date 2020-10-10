//
//  链表.swift
//  BJTLeecodeSwift
//
//  Created by 毕杰涛 on 2020/9/28.
//  Copyright © 2020 毕杰涛. All rights reserved.
//

import Foundation

// MARK: 链表算法1
/*
定义一个函数，输入一个链表的头节点，反转该链表并输出反转后链表的头节点。


示例:

输入: 1->2->3->4->5->NULL
输出: 5->4->3->2->1->NULL
*/
public class ListNode {
    public var val: Int
    public var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


func reverseList(_ head: ListNode?) -> ListNode? {
    if head == nil {
        return nil
    }
    if head?.next == nil {
        return head
    }
    var tmpHead = head
    var tmpNext: ListNode? = nil
    while (tmpHead != nil) {
        let next = tmpHead?.next
        tmpHead?.next = tmpNext
        tmpNext = tmpHead
        tmpHead = next
    }
    return tmpNext
}

