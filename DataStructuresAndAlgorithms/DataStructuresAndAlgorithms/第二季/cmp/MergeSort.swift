//
//  MergeSort.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/2/6.
//

import Foundation

//              0 1 2 3 4 5 6 7
//         0 1 2 3          4 5 6 7
//        0 1    2 3      4 5      6 7
//       0   1   2   3   4   5    6    7

class MergeSort<T: Comparable>: SortArray<T> {
    var leftArray: [T] = []
    override func sortList() {
        sort(0, array.count)
    }
    
    // 对 [begin, end) 范围的数据进行归并排序
    private func sort(_ begin: Int, _ end: Int) {
        if end - begin < 2 {
            return
        }
        
        let mid = (begin + end) >> 1
        sort(begin, mid)
        sort(mid, end)
        merge(begin, mid, end)
    }
    
    // 将 [begin, mid) 和 [mid, end) 范围的序列合并成一个有序序列
    private func merge(_ begin: Int, _ mid: Int, _ end: Int) {
        var li = 0, le = mid - begin
        var ri = mid, re = end
        var ai = begin
        
        leftArray = []
        // 备份左边数组
        for i in li..<le {
            leftArray.append(array[begin + i])
        }
        
        // 如果左边还没有结束
        while li < le {
            if ri < re && cmp(array[ri], leftArray[li]) < 0 {
                array[ai] = array[ri]
                ai += 1
                ri += 1
            } else {
                array[ai] = leftArray[li]
                ai += 1
                li += 1
            }
        }
    }
}
