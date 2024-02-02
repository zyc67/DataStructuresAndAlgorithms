//
//  BaseHeap.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/1/19.
//

import Foundation

class BaseHeap<T: Comparable>: HeapProtocol {
    func add(_ element: T) {
        
    }
    
    func get() -> T? {
        nil
    }
    
    func remove() -> T? {
        nil
    }
    
    func replace(_ element: T) -> T? {
        nil
    }
    
    typealias E = T
    
    var size: Int = 0
    
    func getSize() -> Int {
        size
    }
    
    func isEmpty() -> Bool {
        size == 0
    }
    
    func clear() {
        
    }
}
