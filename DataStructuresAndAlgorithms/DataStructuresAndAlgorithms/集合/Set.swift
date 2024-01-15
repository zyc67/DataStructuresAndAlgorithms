//
//  Set.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/1/13.
//

import Foundation

protocol SetProtocol {
    associatedtype E
    func size() -> Int
    func isEmpty() -> Bool
    func clear()
    func contains(element: E) -> Bool
    func add(element: E)
    func remove(element: E)
}
