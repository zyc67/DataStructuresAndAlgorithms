//
//  BinaryHeap.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/1/19.
//

import Foundation

class BinaryHeap<T: Comparable>: BaseHeap<T> {
    
    var elements: [T?]
    
    init(elements: [T?]) {
        self.elements = Array(repeating: nil, count: max(elements.count, 10))
        super.init()
        if elements.count != 0 {
            for index in 0..<elements.count {
                self.elements[index] = elements[index]
            }
            size = elements.count
            heapify()
        }
    }
    
    override func clear() {
        for index in 0..<elements.count {
            elements[index] = nil
        }
        size = 0
    }
    
    override func add(_ element: T) {
        ensureCapacity(size + 1)
        elements[size] = element
        size += 1
        shiftUp(size - 1)
    }
    
    override func get() -> T? {
        guard size == 0 else {
            return nil
        }
        return elements.first!
    }
    
    override func remove() -> T? {
        guard size != 0 else {
            return nil
        }
        let root = elements.first!
        size -= 1
        elements[0] = elements[size]
        elements[size] = nil
        shiftDown(0)
        return root
    }
    
    override func replace(_ element: T) -> T? {
        var root: T? = nil
        if size == 0 {
            size = 1
            elements[0] = element
        } else {
            root = elements[0]
            elements[0] = element
            shiftDown(0)
        }
        return root
    }
    
    // 批量建堆 自上而下的上滤 和 自下而上的下滤 结果可能不同
    private func heapify() {
        // 自上而下的上滤 类似于 一个一个添加
        for index in 1..<size {
            shiftUp(index)
        }
    
        // 自下而上的下滤
//        for index in stride(from: (size >> 1) - 1, through: 0, by: -1) {
//            shiftDown(index)
//        }
    }
    
    // 让index位置的元素上滤
    private func shiftUp(_ index: Int) {
        var i = index
        let element = elements[index]
        while i > 0 {
            // i > 0 父节点索引是floor((i-1)/2)
            let parentIndex = (i - 1) >> 1
            let parentElement = elements[parentIndex]
            if element! > parentElement! {
                break
            }
            // 将父元素存储在index位置
            elements[i] = parentElement
            // 重新赋值index
            i = parentIndex
        }
        elements[i] = element
    }
    
    // 让index位置的元素下滤
    private func shiftDown(_ index: Int) {
        // 第一个叶子节点的索引 == 非叶子节点的数量
        // index < 第一个叶子节点的索引
        // 必须保证index位置是非叶子节点
        let element = elements[index]!
        let half = size >> 1
        var i = index
        while i < half {
            // index的节点有2种情况
            // 1.只有左子节点
            // 2.同时有左右子节点
            
            // 默认为左子节点跟它进行比较
            var childIndex = (i << 1) + 1
            var child = elements[childIndex]!;
            
            // 右子节点
            let rightIndex = childIndex + 1
            if rightIndex < size && elements[rightIndex]! < child {
                child = elements[rightIndex]!
                childIndex = rightIndex
            }
            if element < child {
                break
            }
            // 将子节点存放到index位置
            elements[i] = child
            // 重新设置index
            i = childIndex
        }
        elements[i] = element
    }
    
    private func ensureCapacity(_ capacity: Int) {
        let oldCapacity = elements.count
        if oldCapacity >= capacity {
            return
        }
        // 新容量为旧容量的1.5倍
        let newCapacity = oldCapacity + oldCapacity >> 1
        var newElements = Array<T?>(repeating: nil, count: newCapacity)
        for index in 0..<elements.count {
            newElements[index] = elements[index]
        }
        elements = newElements
    }
}
