//
//  Hanoi.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/4/26.
//

import Foundation

class Hanoi {
    // 将n个碟子从p1移动到p3,借助于p2
    static func hanoi(_ n: Int, _ p1: String, _ p2: String, _ p3: String) {
        if n == 1 {
            move(1, p1, p3)
            return
        }
        hanoi(n - 1, p1, p3, p2)
        move(n, p1, p3)
        hanoi(n - 1, p2, p1, p3)
    }
    
    // 将 no 号盘子从 from 移动到 to
    static func move(_ no: Int, _ from: String, _ to: String) {
        print("将 \(no) 号盘子从 \(from) 移动到 \(to)")
    }
}

//T(n) = 2 * T(n - 1) + O(1)
//时间复杂度是：O(2^n)
//空间复杂度：O(n)

// T(n) = 2 * [2 * T(n - 2) + O(1)] + O(1)
// T(n) = 2^2 * T(n - 2) + 2 * O(1) + O(1)
// T(n) = 2^2 * [2 * T(n - 3) + O(1)] + 2 * O(1) + O(1)
// T(n) = 2^3 * [2 * T(n - 4) + O(1)] + 2^2 * O(1) + 2 * O(1) + O(1)
// T(n) = 2^4 * T(n - 4) + 2^3 * O(1) + 2^2 * O(1) + 2 * O(1) + O(1)
// T(n) = 2^(n - 1) * T(1) + (2^(n - 2) + 2^(n - 3) + ... + 2^2 + 2^1 + 2^0) * O(1)
// T(n) = (2^(n - 1) + 2^(n - 2) + 2^(n - 3) + ... + 2^2 + 2^1 + 2^0) * O(1)
// T(n) = (2^n - 1) * O(1)
