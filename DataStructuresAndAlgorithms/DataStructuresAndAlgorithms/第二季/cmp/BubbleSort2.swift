//
//  BubbleSort2.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/2/5.
//

import Foundation

class BubbleSort2<T: Comparable>: SortArray<T> {
    override func sortList() {
        for i in 0..<array.count {
            var sorted = true
            for j in 1..<(array.count - i) {
                if cmp(j - 1, j) > 0 {
                    swap(j - 1, j)
                    sorted = false
                }
            }
            // 如果序列已经完全有序，可以提前终止冒泡排序
            if sorted {
                break
            }
        }
    }
}
