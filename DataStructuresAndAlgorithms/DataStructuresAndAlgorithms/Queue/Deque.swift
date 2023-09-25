//
//  Deque.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2023/9/25.
//

/*
 双端队列
 */
import Foundation

class Deque<E> {
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
    
    // MARK: 从队尾入队
    func enQueueRear(_ element: E) {
        list.add(element)
    }
    
    // MARK: 从队头出队
    func deQueueFront() -> E? {
        return list.remove(0)
    }
    
    // MARK: 从队头入队
    func enQueueFront(_ element: E) {
        list.add(0, element)
    }
    
    // MARK: 从队尾出队
    func deQueueRear() -> E? {
        return list.remove(size() - 1)
    }
    
    // MARK: 获取队列的头元素
    func front() -> E? {
        return list.get(0)
    }
    
    // MARK: 获取队列的尾元素
    func rear() -> E? {
        return list.get(size() - 1)
    }
}
