//
//  SelectionSort.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/2/5.
//

import Foundation

class SelectionSort<T: Comparable>: SortArray<T> {
    override func sortList() {
        for i in 0..<array.count {
            var max = 0
            for j in 1..<(array.count - i) {
                if cmp(max, j) < 0 {
                    max = j
                }
            }
            swap(max, array.count - i - 1)
        }
    }
}

//0, 1, 2, 3, 4, 5, 6, 7
//7, 3, 5, 5, 6, 7, 4, 8
