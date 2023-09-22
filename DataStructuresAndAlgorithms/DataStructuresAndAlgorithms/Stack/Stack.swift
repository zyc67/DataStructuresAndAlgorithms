//
//  Stack.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2023/9/22.
//

import Foundation

class Stack<E: Equatable> {
    // 通过复用单向链表实现栈
    let list = SingleLinkedList<E>()
    
    func clear() {
        list.clear()
    }
    
    func size() -> Int {
        return list.size
    }
    
    func isEmpty() -> Bool {
        return list.isEmpty()
    }
    
    func push(_ element: E) {
        list.add(element)
    }
    
    func pop() -> E? {
        if list.size == 0 {
            return nil
        }
        return list.remove(list.size - 1)
    }
    
    func top() -> E? {
        if list.size == 0 {
            return nil
        }
        return list.get(list.size - 1)
    }
}

class Stack2<E> {
    var items: [E] = []
    
    func clear() {
        items.removeAll() // struct改变items要加mutating
    }
    
    func size() -> Int {
        return items.count
    }
    
    func isEmpty() -> Bool {
        return size() == 0
    }
    
    func push(_ element: E) {
        items.append(element)
    }
    
    func pop() -> E? {
        if isEmpty() {
            return nil
        }
        return items.removeLast()
    }
    
    func top() -> E? {
        if isEmpty() {
            return nil
        }
        return items[size() - 1]
    }
}
