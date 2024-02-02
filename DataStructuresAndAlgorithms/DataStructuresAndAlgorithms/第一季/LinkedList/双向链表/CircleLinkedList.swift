//
//  CircleLinkedList.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2023/9/22.
//

/*
 双向循环链表
 */

import Foundation

class CircleLinkedList<T: Equatable> {
    
    class Node<E> {
        // 节点内容
        var element: E?
        //  prev节点
        var prev: Node<E>?
        // next节点
        var next: Node<E>?
        
        init(element: E? = nil, prev: Node<E>? = nil, next: Node<E>? = nil) {
            self.element = element
            self.prev = prev
            self.next = next
        }
    }
    
    // 链表长度
    var size: Int = 0
    // 头节点
    var head: Node<T>?
    // 尾节点
    var tail: Node<T>?
    // 当前节点
    var current: Node<T>?
    
    // MARK: 清空
    func clear() {
        size = 0
        head = nil
        tail = nil
    }
    
    // MARK: 获取index位置对应节点对象
    func get(_ index: Int) -> T? {
        // 最好：O(1) 最坏：O(n) 平均：O(n)
        return node(index)?.element
    }
    
    // MARK: 设置index位置对应节点对象
    @discardableResult
    func set(_ index: Int, _ element: T) -> T? {
        // 最好：O(1) 最坏：O(n) 平均：O(n)
        let node = node(index)
        let old = node?.element
        node?.element = element
        return old
    }
    
    // MARK: 在末尾位置添加节点对象
    func add(_ element: T) {
        add(size, element)
    }
    
    // MARK: 在index位置添加节点对象
    func add(_ index: Int, _ element: T) {
        // 最好：O(1) 最坏：O(n) 平均：O(n)
        if !rangeCheckForAdd(index) {
            return
        }
        
        if index == size { // 在尾部添加
            let prev = tail
            tail = Node(element: element, prev: prev, next: head)
            if prev == nil { // 链表添加的第一个元素
                head = tail
                head?.next = head
                head?.prev = head
            } else {
                prev?.next = tail
                head?.prev = tail
            }
        } else {
            let next = node(index)
            let prev = next?.prev // 这里不要写prev = node(index - 1)，一是重复遍历，二是index == 0会报错
            let current = Node(element: element, prev: prev, next: next)
            next?.prev = current
            prev?.next = current
            if head === next { // index == 0
                head = current
            }
        }
        size += 1
    }
    
    
    /// ----------------------约瑟夫问题用到方法 BEGIN ----------------------
    func reset() {
        current = head
    }
    
    @discardableResult
    func next() -> T? {
        if current == nil {
            return nil
        }
        current = current?.next
        return current?.element
    }
    
    func remove() -> T? {
        if current == nil {
            return nil
        }
        let next = current?.next
        let element = remove(node: current)
        if size == 0 {
            current = nil
        } else {
            current = next
        }
        return element
    }
    /// ----------------------约瑟夫问题用到方法 END ----------------------
    
    
    // MARK: 删除index位置对应节点对象
    @discardableResult
    func remove(_ index: Int) -> T? {
        // 最好：O(1) 最坏：O(n) 平均：O(n)
        if !rangeCheck(index) {
            return nil
        }
        let current = node(index)
        return remove(node: current)
    }
    
    private func remove(node: Node<T>?) -> T? {
        if size == 1 {
            head = nil
            tail = nil
        } else {
            let prev = node?.prev
            let next = node?.next
            
            prev?.next = next
            next?.prev = prev
            
            if node === head { // index == 0
                head = next
            }
            
            if node === tail { // index == size - 1
                tail = prev
            }
        }
       
        size -= 1
        return node?.element
    }
    
    // MARK: 获取节点对象所在位置
    @discardableResult
    func indexOf(_ element: T) -> Int {
        var current = head
        for i in 0..<size {
            if element == current!.element {
                return i
            }
            current = current?.next
        }
        return -1
    }
   
    // MARK: 获取index位置对应的节点对象
    @discardableResult
    private func node(_ index: Int) -> Node<T>? {
        if !rangeCheck(index) {
            return nil
        }
        if index < (size >> 1) {
            var node = head
            for _ in 0..<index {
                node = node?.next
            }
            return node
        } else {
            var node = tail
            for i in stride(from: index - 1, to: size, by: -1) {
                print(i)
                node = node?.prev
            }
            return node
        }
    }
    
    func rangeCheck(_ index: Int) -> Bool {
        let enable = index >= 0 && index < size
        if !enable {
            print("### ERROR ### \(index) out of bounds. size = \(size)")
        }
        return enable
    }
    
    func rangeCheckForAdd(_ index: Int) -> Bool {
        let enable = index >= 0 && index <= size
        if !enable {
            print("### ERROR ### \(index) out of bounds. size = \(size)")
        }
        return enable
    }
}
