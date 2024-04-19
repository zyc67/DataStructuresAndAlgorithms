//
//  UnionFind.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/4/11.
//

import Foundation

class UnionFind {
    var parents: [Int] = []
    
    var capacity: Int = 0
    
    init(capacity: Int) {
        self.capacity = capacity
        for index in 0..<capacity {
            parents.append(index)
        }
    }
    
    func find(_ v: Int) -> Int {
        return 0
    }
    
    func union(_ v1: Int, _ v2: Int) {
        
    }
    
    func isSame(_ v1: Int, _ v2: Int) -> Bool {
        return find(v1) == find(v2)
    }
    
    func rangeCheck(_ v: Int) -> Bool {
        if v < 0 || v >= parents.count {
            return true
        }
        return false
    }
}
