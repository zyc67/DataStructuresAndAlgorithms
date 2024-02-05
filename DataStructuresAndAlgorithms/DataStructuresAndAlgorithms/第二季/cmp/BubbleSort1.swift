//
//  BubbleSort1.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/2/5.
//

import Foundation

class BubbleSort1<T: Comparable>: SortArray<T> {
    override func sortList() {
        for i in 0..<array.count {
            for j in 1..<(array.count - i) {
                if cmp(j - 1, j) > 0 {
                    swap(j - 1, j)
                }
            }
        }
    }
}
