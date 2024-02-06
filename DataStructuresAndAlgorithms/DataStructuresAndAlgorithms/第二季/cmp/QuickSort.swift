//
//  QuickSort.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/2/6.
//

import Foundation

class QuickSort<T: Comparable>: SortArray<T> {
    override func sortList() {
        sort(0, array.count)
    }
    
    // 对 [begin, end) 范围的元素进行快速排序
    private func sort(_ begin: Int, _ end: Int) {
        if end - begin < 2 {
            return
        }
        // 确定轴点位置 O(n)
        let mid = pivotIndex(begin, end)
        sort(begin, mid)
        // 对子序列进行快速排序
        sort(mid + 1, end)
    }
    
    private func pivotIndex(_ begin: Int, _ end: Int) -> Int {
        // 随机选择一个元素跟begin位置进行交换
        swap(begin, begin + Int(arc4random_uniform(UInt32(end - begin))))
        // 备份begin位置的元素
        let pivot = array[begin]
        var b = begin
        var e = end
        // end指向最后一个元素
        e -= 1
        while b < e {
            while b < e {
                if cmp(pivot, array[e]) < 0 { // 右边元素 > 轴点元素
                    e -= 1
                } else { // 右边元素 <= 轴点元素
                    array[b] = array[e]
                    b += 1
                    break
                }
            }
            
            while b < e {
                if cmp(pivot, array[b]) > 0 { // 左边元素 < 轴点元素
                    b += 1
                } else { // 左边元素 >= 轴点元素
                    array[e] = array[b]
                    e -= 1
                    break
                }
            }
        }
        // 将轴点元素放入最终的位置
        array[b] = pivot
        // 返回轴点元素的位置
        return b
    }
}
