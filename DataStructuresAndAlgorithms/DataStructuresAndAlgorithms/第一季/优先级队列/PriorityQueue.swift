//
//  PriorityQueue.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/1/31.
//

import Foundation

class PriorityQueue<T: Comparable> {
    private var heap: BinaryHeap<T>
    
    init() {
        self.heap = BinaryHeap(elements: [])
    }
    
    func getSize() -> Int {
        heap.getSize()
    }
    
    func isEmpty() -> Bool {
        heap.isEmpty()
    }
    
    func clear() {
        heap.clear()
    }
    
    func enQueue(_ element: T) -> Void {
        heap.add(element)
    }
    
    func deQueue() -> T? {
        heap.remove()
    }
    
    func front() -> T? {
        heap.get()
    }
}
