//
//  LeetCode225.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2023/9/25.
//

/*
 225. 用队列实现栈 https://leetcode.cn/problems/implement-stack-using-queues/description/
 
 请你仅使用两个队列实现一个后入先出（LIFO）的栈，并支持普通栈的全部四种操作（push、top、pop 和 empty）。

 实现 MyStack 类：

 void push(int x) 将元素 x 压入栈顶。
 int pop() 移除并返回栈顶元素。
 int top() 返回栈顶元素。
 boolean empty() 如果栈是空的，返回 true ；否则，返回 false 。
 */

import Foundation

class MyStack_225 {
    
    var inQueue: [Int] = []
    var outQueue: [Int] = []

    init() {

    }
    
    func push(_ x: Int) {
        if outQueue.count != 0 {
            outQueue.append(x)
        } else  {
            inQueue.append(x)
        }
    }
    
    func pop() -> Int {
        if inQueue.count != 0 && outQueue.count == 0 {
            while inQueue.count > 1 {
                outQueue.append(inQueue.removeFirst())
            }
            let topElement = inQueue.first!
            inQueue.removeFirst()
            return topElement
        } else if inQueue.count == 0 && outQueue.count != 0 {
            while outQueue.count > 1 {
                inQueue.append(outQueue.removeFirst())
            }
            let topElement = outQueue.first!
            outQueue.removeFirst()
            return topElement
        }
        return -1
    }
    
    func top() -> Int {
        if inQueue.count != 0 && outQueue.count == 0 {
            while inQueue.count > 1 {
                outQueue.append(inQueue.removeFirst())
            }
            let topElement = inQueue.first!
            outQueue.append(inQueue.removeFirst())
            return topElement
        } else if inQueue.count == 0 && outQueue.count != 0 {
            while outQueue.count > 1 {
                inQueue.append(outQueue.removeFirst())
            }
            let topElement = outQueue.first!
            inQueue.append(outQueue.removeFirst())
            return topElement
        }
        return -1
    }
    
    func empty() -> Bool {
        return inQueue.count == 0 && outQueue.count == 0
    }
}


