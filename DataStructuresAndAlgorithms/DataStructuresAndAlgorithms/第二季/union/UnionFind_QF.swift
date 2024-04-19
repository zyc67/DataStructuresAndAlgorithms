//
//  UnionFind_QF.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/4/17.
//

import Foundation

/*
 * Quick Find
 */

class UnionFind_QF : UnionFind {
    // 父节点就是根节点 O(1)
    override func find(_ v: Int) -> Int {
        if rangeCheck(v) {
            return -1
        }
        return parents[v]
    }
    
    // 让 v1 所在集合的所有元素都指向 v2 的根节点  O(n)
    override func union(_ v1: Int, _ v2: Int) {
        let p1 = find(v1)
        let p2 = find(v2)
        if p1 == p2 {
            return
        }
        for (i, data) in parents.enumerated() {
            if data == p1 {
                parents[i] = p2
            }
        }
    }
}
