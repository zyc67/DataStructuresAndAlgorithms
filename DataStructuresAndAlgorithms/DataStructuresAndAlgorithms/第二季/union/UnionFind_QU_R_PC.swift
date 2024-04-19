//
//  UnionFind_QU_R_PC.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/4/17.
//

import Foundation
/*
 * Quick Union - 基于rank的优化 - 路径压缩(Path Compression)
 * 在find时使路径上的所有节点都指向根节点，从而降低树的高度
 * 路径压缩使路径上的所有节点都指向根节点，所以实现成本稍高
 */

class UnionFind_QU_R_PC: UnionFind_QU_R {
    override func find(_ v: Int) -> Int {
        if rangeCheck(v) {
            return -1
        }
        if v != parents[v] {
            parents[v] = find(parents[v])
        }
        return parents[v]
    }
}
// 0 1 2 3 4 5 6 7
// 1 1 2 4 5 7 6 7
