//
//  UnionFind_QU.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/4/17.
//

import Foundation

/*
 * Quick Union
 */

class UnionFind_QU : UnionFind {
    // 父节点就是根节点 O(logn)
    override func find(_ v: Int) -> Int {
        if rangeCheck(v) {
            return -1
        }
        var temp = v
        while parents[temp] != temp {
            temp = parents[temp]
        }
        return temp
    }
    
    // 让 v1 的根节点指向 v2 的根节点 O(logn)
    override func union(_ v1: Int, _ v2: Int) {
        let p1 = find(v1)
        let p2 = find(v2)
        if p1 == p2 {
            return
        }
        parents[p1] = p2
    }
}
