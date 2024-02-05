//
//  Sort.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/2/2.
//

import Foundation

class SortArray<T: Comparable> : Comparable, CustomStringConvertible {
    // 需要比较的数组
    var array: [T] = []
    // 比较次数
    var cmpCount: Int = 0
    // 交换次数
    var swapCount: Int = 0
    // 耗时
    var time: CLong = 0
    
    var description: String {
        let timeStr = "耗时:\(time)s(\(time * 1000)ms)"
        let compareCountStr = "比较:\(numberString(cmpCount))"
        let swapCountStr = "交换:\(numberString(swapCount))"
        
        return "[\(String(describing: type(of: self)))]\n"
                + timeStr + "\t"
                + compareCountStr + "\t"
                + swapCountStr + "\t"
                + "------------------------------------------------------------------"
    }
    
    static func < (lhs: SortArray<T>, rhs: SortArray<T>) -> Bool {
        var result = lhs.time - rhs.time
        if result != 0 {
            return result < 0
        }
        
        result = lhs.cmpCount - rhs.cmpCount
        if result != 0 {
            return result < 0
        }
        
        return lhs.swapCount < rhs.swapCount
    }
    
    static func == (lhs: SortArray<T>, rhs: SortArray<T>) -> Bool {
        var result = lhs.time - rhs.time
        if result == 0 {
            return true
        }
        
        result = lhs.cmpCount - rhs.cmpCount
        if result == 0 {
            return true
        }
        
        return lhs.swapCount == rhs.swapCount
    }
    
    // 排序
    func sortWith(_ array: [T]) {
        self.array = array
        let begin = Date().timeIntervalSince1970
        sortList()
        time = CLong(Date().timeIntervalSince1970 - begin)
    }
    
    // 子类去实现排序算法
    func sortList() { }
  
    // i1 i2 下标
    // 返回值等于0，代表 array[i1] == array[i2]
    // 返回值小于0，代表 array[i1] < array[i2]
    // 返回值大于0，代表 array[i1] > array[i2]
    func cmp(_ i1: Int, _ i2: Int) -> Int {
        cmpCount += 1
        let data1 = array[i1]
        let data2 = array[i2]
        if data1 == data2 {
            return 0
        } else if data1 < data2 {
            return -1
        }
        return 1
    }
    
    // v1 v2 实现了Comparable协议的元素
    func cmp(_ v1: T, _ v2: T) -> Int {
        cmpCount += 1
        if v1 == v2 {
            return 0
        } else if v1 < v2 {
            return -1
        }
        return 1
    }
    
    // 交换两个元素
    func swap(_ i1: Int, _ i2: Int) {
        swapCount += 1
        let temp = array[i1]
        array[i1] = array[i2]
        array[i2] = temp
    }
    
    func numberString(_ number: Int) -> String {
        if number < 10000 {
            return "\(number)"
        }
        if number < 100000000 {
            return "\(Double(number)/10000.0)万"
        }
        return "\(Double(number)/100000000.0)亿"
    }
}
