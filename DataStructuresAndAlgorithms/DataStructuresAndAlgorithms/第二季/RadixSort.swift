//
//  RadixSort.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/4/11.
//

import Foundation

class RadixSort: SortArray<Int> {
    override func sortList() {
        // 找出最大值
        var max = array.first!
        for data in array {
            if data > max {
                max = data
            }
        }
        
        // 个位数: array[i] / 1 % 10 = 3
        // 十位数：array[i] / 10 % 10 = 9
        // 百位数：array[i] / 100 % 10 = 5
        // 千位数：array[i] / 1000 % 10 = ...
        var divider = 1
        while divider <= max {
            countingSort(divider)
            divider *= 10
        }
    }
    
    func countingSort(_ divider: Int) {
        // 开辟内存空间，存储次数
        var counts = Array(repeating: 0, count: 10)
        // 统计每个整数出现的次数
        for data in array {
            counts[data / divider % 10] += 1
        }
        // 累加次数
        for (i, _) in counts.enumerated() {
            if i > 0 {
                counts[i] += counts[i - 1]
            }
        }
        // 从后往前遍历元素，将它放到有序数组中的合适位置
        var newArray = Array(repeating: 0, count: array.count)
        for i in stride(from: array.count - 1, through: 0, by: -1) {
            counts[array[i] / divider % 10] -= 1
            newArray[counts[array[i] / divider % 10]] = array[i]
        }
        // 将有序数组赋值到array
        for (i, data) in newArray.enumerated() {
            array[i] = data
        }
    }
}
// 0     1   2   3   4  5   6   7
//[126, 69, 593, 23, 6, 89, 54, 8]
