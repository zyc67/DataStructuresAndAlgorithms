//
//  InsertionSort3.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/2/6.
//

import Foundation

class InsertionSort3<T: Comparable>: SortArray<T> {
    override func sortList() {
        for index in 1..<array.count {
            insert(index, search(index))
        }
    }
    
    // 将source位置的元素插入到dest位置
    func insert(_ source: Int, _ dest: Int) {
        let v = array[source]
        for i in stride(from: source, to: dest, by: -1) {
            array[i] = array[i - 1]
        }
        array[dest] = v
    }
    
    
    // 利用二分搜索找到 index 位置元素的待插入位置
    // 已经排好序数组的区间范围是 [0, index)
    func search(_ index: Int) -> Int {
        var begin = 0
        var end = index
        while begin < end {
            let mid = (begin + end) >> 1
            if cmp(index, mid) < 0 {
                end = mid
            } else {
                begin = mid + 1
            }
        }
        return begin
    }
}
