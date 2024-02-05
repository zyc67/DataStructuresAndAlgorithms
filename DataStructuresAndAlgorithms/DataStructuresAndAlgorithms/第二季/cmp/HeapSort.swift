//
//  HeapSort.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/2/5.
//

import Foundation
class HeapSort<T: Comparable>: SortArray<T> {
    var size = 0
    
    override func sortList() {
        size = array.count
        
        // 自上而下的上滤 类似于 一个一个添加
//        for index in 1..<size {
//            shiftUp(index)
//        }
    
        // 自下而上的下滤
        for index in stride(from: (size >> 1) - 1, through: 0, by: -1) {
            shiftDown(index)
        }
        
        while size > 1 {
            size -= 1
            // 交换堆顶元素和尾部元素
            swap(0, size)
            // 对0位置进行siftDown（恢复堆的性质）
            shiftDown(0)
        }
    }
    
    // 让index位置的元素下滤
    private func shiftDown(_ index: Int) {
        // 第一个叶子节点的索引 == 非叶子节点的数量
        // index < 第一个叶子节点的索引
        // 必须保证index位置是非叶子节点
        if size == 0 {
            return
        }
        let element = array[index]
        let half = size >> 1
        var i = index
        while i < half {
            // index的节点有2种情况
            // 1.只有左子节点
            // 2.同时有左右子节点
            
            // 默认为左子节点跟它进行比较
            var childIndex = (i << 1) + 1
            var child = array[childIndex]
            
            // 右子节点
            let rightIndex = childIndex + 1
            if rightIndex < size && cmp(array[rightIndex], child) > 0 {
                child = array[rightIndex]
                childIndex = rightIndex
            }
            if cmp(element, child) >= 0 {
                break
            }
            // 将子节点存放到index位置
            array[i] = child
            // 重新设置index
            i = childIndex
        }
        array[i] = element
    }
}
