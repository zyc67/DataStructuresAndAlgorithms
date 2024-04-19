//
//  UnionFind_QU_R.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/4/17.
//

import Foundation

/*
 * Quick Union 基于rank的优化：矮的树 嫁接到 高的树
 */

class UnionFind_QU_R : UnionFind_QU {
    var ranks: [Int] = []
    override init(capacity: Int) {
        super.init(capacity: capacity)
        for _ in 0..<capacity {
            ranks.append(1)
        }
        
    }
  
    // 让 v1 的根节点指向 v2 的根节点
    override func union(_ v1: Int, _ v2: Int) {
        let p1 = find(v1)
        let p2 = find(v2)
        if p1 == p2 {
            return
        }
        if ranks[p1] < ranks[p2] {
            parents[p1] = p2
        } else if ranks[p1] > ranks[p2] {
            parents[p2] = p1
        } else {
            parents[p1] = p2
            ranks[p2] += 1
        }
    }
}
