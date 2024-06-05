//
//  CoinChange.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/6/3.
//

import Foundation

/*
 假设有 25 分、10 分、5 分、1 分的硬币，现要找给客户 41 分的零钱，如何办到硬币个数最少？
 贪心策略：每一次都优先选择面值最大的硬币
 ① 选择 25 分的硬币，剩 16 分
 ② 选择 10 分的硬币，剩 6 分
 ③ 选择 5 分的硬币，剩 1 分
 ④ 选择 1 分的硬币
 最终的解是共 4 枚硬币
 ✓ 25 分、10 分、5 分、1 分硬币各一枚
 */

class CoinChange {
    func coinChange() {
        var faces: [Int] = [25, 20, 5, 1]
//        var faces: [Int] = [25, 5, 10, 1]
        var money: Int = 41
        
        faces.sort { $0 > $1}
        
        var index = 0
        while index < faces.count {
            let face = faces[index]
            if money >= face {
                money -= face
                print("第\(index + 1)次选了\(face)分硬币")
            } else {
                index += 1
            }
        }
    }
}
