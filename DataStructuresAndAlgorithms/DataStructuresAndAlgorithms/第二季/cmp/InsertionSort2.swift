//
//  InsertionSort2.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/2/5.
//

import Foundation

class InsertionSort2<T: Comparable>: SortArray<T> {
    override func sortList() {
        for i in 1..<array.count {
            var cur = i
            let v = array[cur]
            while cur > 0 && cmp(v, array[cur - 1]) < 0 {
                array[cur] = array[cur - 1]
                cur -= 1
            }
            array[cur] = v
        }
    }
}
