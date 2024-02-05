//
//  Integers.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/2/5.
//

import Foundation

class Integers {
    static func isAscOrder(_ array: [Int]) -> Bool {
        if array.isEmpty {
            return false
        }
        for index in 1..<array.count {
            if array[index - 1] > array[index] {
                return false
            }
        }
        return true
    }
}
