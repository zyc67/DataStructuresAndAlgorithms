//
//  ListSet.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/1/13.
//

import Foundation

class ListSet: Set {
    let list = SingleLinkedList<Int>()
    
    func size() -> Int {
        return list.size
    }
    
    func isEmpty() -> Bool {
        return list.isEmpty()
    }
    
    func clear() {
        list.clear()
    }
    
    func contains(element: Int) -> Bool {
        return list.indexOf(element) != -1
    }
    
    func add(element: Int) {
        let index = list.indexOf(element)
        if index != -1 { // 存在就覆盖
            list.set(index, element)
        } else { // 不存在就添加
            list.add(element)
        }
    }
    
    func remove(element: Int) {
        let index = list.indexOf(element)
        if index != -1 {
            list.remove(index)
        }
    }
}
