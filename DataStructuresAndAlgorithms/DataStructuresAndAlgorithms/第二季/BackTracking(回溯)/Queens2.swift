//
//  Queens.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/5/28.
//

import Foundation

class Queens2 {
    // 数组索引是行号，数组元素是列号
    var queens: [Int] = []
    
    // 标记着某一列是否有皇后
    var cols: [Bool] = []
    
    // 标记着某一斜线上是否有皇后（左上角 -> 右下角）
    var leftTop: [Bool] = []
    
    // 标记着某一斜线上是否有皇后（右上角 -> 左下角）
    var rightTop: [Bool] = []
    
    // 一共有多少种摆法
    var ways: Int = 0
    
    func placeQueens(_ n: Int) {
        if n < 1 {
            return
        }
        queens = Array(repeating: 0, count: n)
        cols = Array(repeating: false, count: n)
        leftTop = Array(repeating: false, count: (n << 1) - 1)
        rightTop = Array(repeating: false, count: leftTop.count)
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
            if cols[col] {
                continue
            }
            let ltIndex = row - col + cols.count - 1
            if leftTop[ltIndex] {
                continue
            }
            let rtIndex = row + col
            if rightTop[rtIndex] {
                continue
            }
            queens[row] = col
            cols[col] = true
            leftTop[ltIndex] = true
            rightTop[rtIndex] = true
            place(row + 1)
            cols[col] = false
            leftTop[ltIndex] = false
            rightTop[rtIndex] = false
        }
    }
    
    func show() {
        for row in 0..<queens.count {
            for col in 0..<queens.count {
                if col == queens[row] {
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
