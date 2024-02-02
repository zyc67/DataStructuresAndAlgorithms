//
//  CircleQueue.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2023/9/25.
//

/*
 循环队列
 */

import Foundation

class CircleQueue<E> {
    var elements: [E?] = []
    var frontIndex: Int = 0
    var size: Int = 0
    
    init() {
        elements = Array(repeating: nil, count: 10)
    }
    
    // MARK: 是否为空
    func isEmpty() -> Bool {
        return size == 0
    }
    
    // MARK: 清空
    func clear() {
        for index in 0..<elements.count {
            elements[getIndex(index)] = nil
        }
        frontIndex = 0
        size = 0
    }
    
    // MARK: 入队
    func enQueue(_ element: E) {
        ensureCapacity(size + 1)
        elements[getIndex(size)] = element
        size += 1
    }
    
    // MARK: 出队
    @discardableResult
    func deQueue() -> E? {
       let frontElement = elements[frontIndex]
       elements[frontIndex] = nil
       frontIndex = getIndex(1)
       size -= 1
       return frontElement
    }
    
    // MARK: 获取队列的头元素
    @discardableResult
    func front() -> E? {
       return elements[frontIndex]
    }
    
    // MARK: 获取队列中真实的index
    private func getIndex(_ index: Int) -> Int {
        // 尽量避免使用乘、除、模、浮点运算，效率低下
        // return (frontIndex + index) % elements.count
        // n % m 等价于 n - (n >= m ? m : 0) 且 n < 2m
        let i = index + frontIndex
        return i - (i >= elements.count ? elements.count : 0)
    }
    
    // MARK: 保证要有capacity的容量
    private func ensureCapacity(_ capacity: Int) {
        let oldCapacity = elements.count
        if oldCapacity >= capacity { return }
        let newCapacity = oldCapacity + (oldCapacity >> 1)
        var newElements = Array<E?>(repeating: nil, count: newCapacity)
        for index in 0..<size {
            newElements[index] = elements[getIndex(index)]
        }
        elements = newElements
        frontIndex = 0
    }
}
