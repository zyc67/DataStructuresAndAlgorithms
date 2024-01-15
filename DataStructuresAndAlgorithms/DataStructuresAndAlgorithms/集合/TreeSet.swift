//
//  TreeSet.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/1/13.
//

import Foundation

class TreeSet: SetProtocol {
    let tree = RBTree<Int>()
    
    func size() -> Int {
        return tree.size
    }
    
    func isEmpty() -> Bool {
        return tree.isEmpty()
    }
    
    func clear() {
        tree.clear()
    }
    
    func contains(element: Int) -> Bool {
        return tree.contains(element)
    }
    
    func add(element: Int) {
        tree.add(element)
    }
    
    func remove(element: Int) {
        tree.remove(element)
    }
}
