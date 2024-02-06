//
//  InsertionSort1.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/2/5.
//

import Foundation

class InsertionSort1<T: Comparable>: SortArray<T> {
    override func sortList() {
        for i in 1..<array.count {
            var cur = i
            while cur > 0 && cmp(cur, cur - 1) < 0 {
                swap(cur, cur - 1)
                cur -= 1
            }
        }
    }
}
