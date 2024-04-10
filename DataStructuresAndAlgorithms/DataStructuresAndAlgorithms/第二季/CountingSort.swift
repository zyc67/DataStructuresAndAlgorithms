//
//  CountingSort.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/4/7.
//

import Foundation

class CountingSort: SortArray<Int> {
    override func sortList() {
        // 找出最值
        var min = array.first!
        var max = array.first!
        for data in array {
            if data > max {
                max = data
            }
            if data < min {
                min = data
            }
        }
        // 开辟内存空间，存储次数
        var counts = Array(repeating: 0, count: max - min + 1)
        // 统计每个整数出现的次数
        for data in array {
            counts[data - min] += 1
        }
        // 累加次数
        for (i, _) in counts.enumerated() {
            if i > 0 {
                counts[i] += counts[i - 1]
            }
        }
        // 从后往前遍历元素，将它放到有序数组中的合适位置
        var newArray = Array(repeating: 0, count: array.count)
        for i in stride(from: array.count - 1, through: 0, by: -1) {
            counts[array[i] - min] -= 1
            newArray[counts[array[i] - min]] = array[i]
        }
        // 将有序数组赋值到array
        for (i, data) in newArray.enumerated() {
            array[i] = data
        }
    }
    
    private func sort0() {
        // 找出最大值
        var max = array.first!
        for data in array {
            if data > max {
                max = data
            }
        } // O(n)
        
        // 开辟内存空间，存储每个整数出现的次数
        var counts = Array(repeating: 0, count: max + 1)
        // 统计每个整数出现的次数
        for data in array {
            counts[data] += 1
        } // O(n)
        
        // 根据整数的出现次数，对整数进行排序
        var index = 0
        for (i, var data) in counts.enumerated() {
            while data > 0 {
                array[index] = i
                index += 1
                data -= 1
            }
        } // O(n)
    }
    
    func sortPersons() {
        var persons = [
            Person(name: "A", age: 20),
            Person(name: "B", age: -13),
            Person(name: "C", age: 17),
            Person(name: "D", age: 12),
            Person(name: "E", age: -13),
            Person(name: "F", age: 20),
        ]
        
        // 找出最值
        var min = persons.first!.age
        var max = persons.first!.age
        for data in persons {
            if data.age > max {
                max = data.age
            }
            if data.age < min {
                min = data.age
            }
        }
        // 开辟内存空间，存储次数
        var counts = Array(repeating: 0, count: max - min + 1)
        // 统计每个整数出现的次数
        for data in persons {
            counts[data.age - min] += 1
        }
        // 累加次数
        for (i, _) in counts.enumerated() {
            if i > 0 {
                counts[i] += counts[i - 1]
            }
        }
        // 从后往前遍历元素，将它放到有序数组中的合适位置
        var newArray: [Person?] = Array(repeating: nil, count: persons.count)
        for i in stride(from: persons.count - 1, through: 0, by: -1) {
            counts[persons[i].age - min] -= 1
            newArray[counts[persons[i].age - min]] = persons[i]
        }
        // 将有序数组赋值到array
        for (i, data) in newArray.enumerated() {
            persons[i] = data!
        }
        print(persons) // [B: -13, E: -13, D: 12, C: 17, A: 20, F: 20]
    }
   
}
