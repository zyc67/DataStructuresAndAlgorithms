//
//  UnionFind_QU_R_PH.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/4/17.
//

import Foundation
/*
 * Quick Union - 基于rank的优化 - 路径减半(Path Halving)
 * 使路径上每隔一个节点就指向其祖父节点（parent的parent）
 */
class UnionFind_QU_R_PH: UnionFind_QU_R {
    override func find(_ v: Int) -> Int {
        if rangeCheck(v) {
            return -1
        }
        var temp = v
        while temp != parents[temp] {
            let p = parents[temp]
            parents[temp] = parents[p]
            temp = parents[temp]
        }
        return temp
    }
}
