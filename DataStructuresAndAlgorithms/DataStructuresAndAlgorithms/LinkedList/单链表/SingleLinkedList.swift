//
//  SingleLinkedList.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2023/9/18.
//

/*
 单向链表
 */
import Foundation

class SingleLinkedList<T: Equatable> {
    
    class Node<E> {
        // 节点内容
        var element: E?
        // next节点
        var next: Node<E>?
        
        init(element: E? = nil, next: Node<E>? = nil) {
            self.element = element
            self.next = next
        }
    }
    
    // 链表长度
    var size: Int = 0
    // 头节点
    var head: Node<T>?
    
    // MARK: 清空
    func clear() {
        size = 0
        head = nil
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
        
        if index == 0 {
            head = Node(element: element, next: head)
        } else {
            let prev = node(index - 1)
            prev?.next = Node(element: element, next: prev?.next)
        }
        size += 1
    }
    
    // MARK: 删除index位置对应节点对象
    @discardableResult
    func remove(_ index: Int) -> T? {
        // 最好：O(1) 最坏：O(n) 平均：O(n)
        if !rangeCheck(index) {
            return nil
        }
        var current = head
        if index == 0 {
            head = head?.next
        } else {
            let prev = node(index - 1)
            current = prev?.next
            prev?.next = current?.next
        }
        size -= 1
        return current?.element
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
        var node = head
        for _ in 0..<index {
            node = node?.next
        }
        return node
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
