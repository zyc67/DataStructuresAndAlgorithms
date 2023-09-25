//
//  Queue.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2023/9/25.
//

/*
 队列
 */

import Foundation

class Queue<E> {
    let list = LinkedList<E>()
    
    // MARK: 元素数量
    func size() -> Int {
        return list.size
    }
    
    // MARK: 是否为空
    func isEmpty() -> Bool {
        return list.isEmpty()
    }
    
    // MARK: 清空
    func clear() {
        list.clear()
    }
    
    // MARK: 入队
    func enQueue(_ element: E) {
        list.add(element)
    }
    
    // MARK: 出队
    func deQueue() -> E? {
        return list.remove(0)
    }
    
    // MARK: 获取队列的头元素
    func front() -> E? {
        return list.get(0)
    }
}
