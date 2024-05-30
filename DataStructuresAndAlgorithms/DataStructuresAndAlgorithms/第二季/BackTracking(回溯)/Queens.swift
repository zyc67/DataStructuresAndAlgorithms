//
//  Queens.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/5/28.
//

import Foundation

class Queens {
    // 数组索引是行号，数组元素是列号
    var cols: [Int] = []
    
    // 一共有多少种摆法
    var ways: Int = 0
    
    func placeQueens(_ n: Int) {
        if n < 1 {
            return
        }
        cols = Array(repeating: 0, count: n)
        place(0)
        print("\(n)皇后一共有\(ways)中摆法")
    }
    
    // 从第row行开始摆放皇后
    func place(_ row: Int) {
        if row == cols.count {
            ways += 1
            show()
            return
        }
        
        for col in 0..<cols.count {
            if (isValid(row, col)) {
                // 在第row行第col列摆放皇后
                cols[row] = col
                place(row + 1)
            }
        }
    }
    
    // 判断第row行第col列是否可以摆放皇后
    func isValid(_ row: Int, _ col: Int) -> Bool {
        for i in 0..<row {
            // 第col列已经有皇后
            if cols[i] == col {
//                print("[\(row)][\(col)] = false")
                return false
            }
            if row - i == abs(col - cols[i]) {
//                print("[\(row)][\(col)] = false")
                return false
            }
        }
//        print("[\(row)][\(col)] = true")
        return true
    }
    
    func show() {
        for row in 0..<cols.count {
            for col in 0..<cols.count {
                if col == cols[row] {
                    print("1 ", terminator: "")
                } else {
                    print("0 ", terminator: "")
                }
            }
            print("\n")
        }
        print("-----------------------")
    }
}
