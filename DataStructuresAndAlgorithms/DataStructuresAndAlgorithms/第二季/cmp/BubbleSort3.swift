//
//  BubbleSort3.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/2/5.
//

import Foundation

// 如果序列尾部已经局部有序，可以记录最后1次交换的位置，减少比较次数
class BubbleSort3<T: Comparable>: SortArray<T> {
    override func sortList() {
        var sortedIndex = array.count
        for i in 0..<sortedIndex {
            for j in 1..<(array.count - i) {
                if cmp(j - 1, j) > 0 {
                    swap(j - 1, j)
                    sortedIndex = j
                }
            }
        }
    }
}
//7, 3, 5, 8, 9, 10, 14, 15
