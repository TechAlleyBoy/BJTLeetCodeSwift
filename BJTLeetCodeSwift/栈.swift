//
//  栈.swift
//  BJTLeecodeSwift
//
//  Created by 毕杰涛 on 2020/10/10.
//  Copyright © 2020 毕杰涛. All rights reserved.
//

import Foundation

// MARK: 栈算法1
/*
用两个栈实现一个队列。队列的声明如下，请实现它的两个函数 appendTail 和 deleteHead ，分别完成在队列尾部插入整数和在队列头部删除整数的功能。(若队列中没有元素，deleteHead 操作返回 -1 )

 

示例 1：

输入：
["CQueue","appendTail","deleteHead","deleteHead"]
[[],[3],[],[]]
输出：[null,null,3,-1]
示例 2：

输入：
["CQueue","deleteHead","appendTail","appendTail","deleteHead","deleteHead"]
[[],[],[5],[2],[],[]]
输出：[null,-1,null,null,5,2]
*/
class Stack {
    var array: [Int]
    init() {
        array = []
    }
    
    func push(_ value: Int) {
        array.append(value)
    }
    
    func pop() -> Int {
        if array.isEmpty {
            return -1
        }
        return array.remove(at: 0)
    }
    
    func isEmpty() -> Bool {
        return array.isEmpty
    }
}


class CQueue {
    var stackA: Stack
    var stackB: Stack

    init() {
        stackA = Stack()
        stackB = Stack()
    }
    
    func appendTail(_ value: Int) {
        stackA.push(value)
    }
    
    func deleteHead() -> Int {
        if stackB.isEmpty() {
            while !stackA.isEmpty() {
                stackB.push(stackA.pop())
            }
        }
        
        if stackB.isEmpty() {
            return -1;
        }
        
        return stackB.pop()
    }
}


// MARK: 栈算法2
/*
有效括号字符串为空 ("")、"(" + A + ")" 或 A + B，其中 A 和 B 都是有效的括号字符串，+ 代表字符串的连接。例如，""，"()"，"(())()" 和 "(()(()))" 都是有效的括号字符串。

如果有效字符串 S 非空，且不存在将其拆分为 S = A+B 的方法，我们称其为原语（primitive），其中 A 和 B 都是非空有效括号字符串。

给出一个非空有效字符串 S，考虑将其进行原语化分解，使得：S = P_1 + P_2 + ... + P_k，其中 P_i 是有效括号字符串原语。

对 S 进行原语化分解，删除分解中每个原语字符串的最外层括号，返回 S 。

 

示例 1：

输入："(()())(())"
输出："()()()"
解释：
输入字符串为 "(()())(())"，原语化分解得到 "(()())" + "(())"，
删除每个部分中的最外层括号后得到 "()()" + "()" = "()()()"。
示例 2：

输入："(()())(())(()(()))"
输出："()()()()(())"
解释：
输入字符串为 "(()())(())(()(()))"，原语化分解得到 "(()())" + "(())" + "(()(()))"，
删除每个部分中的最外层括号后得到 "()()" + "()" + "()(())" = "()()()()(())"。
示例 3：

输入："()()"
输出：""
解释：
输入字符串为 "()()"，原语化分解得到 "()" + "()"，
删除每个部分中的最外层括号后得到 "" + "" = ""。
 

提示：

S.length <= 10000
S[i] 为 "(" 或 ")"
S 是一个有效括号字符串
*/

class Solution {
    func removeOuterParentheses(_ S: String) -> String {
        var tmpStr:String = String()
    if S.isEmpty {
        tmpStr = ""
    }else {
        var left = 0
        for char in S {
            if char == "(" {
                if left != 0 {
                    tmpStr.append(char)
                }
                left+=1
            }
            
            if char == ")" {
                left-=1
                if left != 0 {
                    tmpStr.append(char)
                }
            }
        }
    }
    return tmpStr
    }
}
