//
//  HeapProtocol.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/1/19.
//

import Foundation

protocol HeapProtocol {
    associatedtype E
    func getSize() -> Int // 元素的数量
    func isEmpty() -> Bool // 是否为空
    func clear() // 清空
    func add(_ element: E) // 添加元素
    func get() -> E? // 获得堆顶元素
    func remove() -> E? // 删除堆顶元素
    func replace(_ element: E) -> E? // 删除堆顶元素的同时插入一个新元素
    
}
