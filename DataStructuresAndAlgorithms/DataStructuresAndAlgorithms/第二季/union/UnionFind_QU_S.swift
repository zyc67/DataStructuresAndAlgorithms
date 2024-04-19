//
//  UnionFind_QU_S.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/4/17.
//

import Foundation

/*
 * Quick Union 基于size的优化：元素少的树 嫁接到 元素多的树
 */

class UnionFind_QU_S : UnionFind_QU {
    var sizes: [Int] = []
    override init(capacity: Int) {
        super.init(capacity: capacity)
        for _ in 0..<capacity {
            sizes.append(1)
        }
    }
    // 让 v1 的根节点指向 v2 的根节点
    override func union(_ v1: Int, _ v2: Int) {
        let p1 = find(v1)
        let p2 = find(v2)
        if p1 == p2 {
            return
        }
        if sizes[p1] < sizes[p2] {
            parents[p1] = p2
            sizes[p2] += sizes[p1]
        } else {
            parents[p2] = p1
            sizes[p1] += sizes[p2]
        }
    }
}
