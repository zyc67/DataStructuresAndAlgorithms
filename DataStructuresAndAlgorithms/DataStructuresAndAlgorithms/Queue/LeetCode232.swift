//
//  LeetCode232.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2023/9/25.
//

/*
 232. 用栈实现队列 https://leetcode.cn/problems/implement-queue-using-stacks/description/
 
 请你仅使用两个栈实现先入先出队列。队列应当支持一般队列支持的所有操作（push、pop、peek、empty）：

 实现 MyQueue 类：

 void push(int x) 将元素 x 推到队列的末尾
 int pop() 从队列的开头移除并返回元素
 int peek() 返回队列开头的元素
 boolean empty() 如果队列为空，返回 true ；否则，返回 false
 说明：

 你 只能 使用标准的栈操作 —— 也就是只有 push to top, peek/pop from top, size, 和 is empty 操作是合法的。
 你所使用的语言也许不支持栈。你可以使用 list 或者 deque（双端队列）来模拟一个栈，只要是标准的栈操作即可。
 */

import Foundation

/*
 入队：push到inStack
 出队：outStack为空，将inStack元素逐一弹出，push到outStack，outStack弹出栈顶元素
      outStack非空，outStack弹出栈顶元素
 */

class MyQueue {
    
    var inStack: [Int] = []
    var outStack: [Int] = []
    

    init() {

    }
    
    func push(_ x: Int) {
        inStack.append(x)
    }
    
    func pop() -> Int {
        if empty() {
            return -1
        }
        checkOutStack()
        return outStack.removeLast()
    }
    
    func peek() -> Int {
        if empty() {
            return -1
        }
        checkOutStack()
        return outStack.last!
    }
    
    func empty() -> Bool {
        return inStack.count == 0 && outStack.count == 0
    }
    
    private func checkOutStack() {
        if outStack.count == 0 {
            while inStack.count > 0 {
                outStack.append(inStack.removeLast())
            }
        }
    }
}
