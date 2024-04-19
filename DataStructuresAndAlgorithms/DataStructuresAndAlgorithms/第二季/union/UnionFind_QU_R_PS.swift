//
//  UnionFind_QU_R_PS.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/4/17.
//

import Foundation
/*
 * Quick Union - 基于rank的优化 - 路径分裂(Path Spliting)
 * 使路径上的每个节点都指向其祖父节点（parent的parent）
 */
class UnionFind_QU_R_PS: UnionFind_QU_R {
    override func find(_ v: Int) -> Int {
        if rangeCheck(v) {
            return -1
        }
        var temp = v
        while temp != parents[temp] {
            let p = parents[temp]
            parents[temp] = parents[p]
            temp = p
        }
        return temp
    }
}
