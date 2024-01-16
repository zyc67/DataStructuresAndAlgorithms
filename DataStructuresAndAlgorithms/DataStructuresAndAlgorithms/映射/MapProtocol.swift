//
//  MapProtocol.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/1/15.
//

import Foundation

protocol MapProtocol {
    associatedtype K
    associatedtype V
    func getSize() -> Int
    func isEmpty() -> Bool
    func clear()
    func put(key: K, value: V) -> V?
    func get(key: K) -> V?
    func remove(key: K) -> V?
    func containsKey(key: K) -> Bool
    func containsValue(value: V) -> Bool
}
