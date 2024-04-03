//
//  ShellSort.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/4/3.
//

import Foundation

class ShellSort<T: Comparable>: SortArray<T> {
    override func sortList() {
        let stepSequence1  = shellStepSequence()
        let stepSequence2  = sedgewickStepSequence()
        
        for step in stepSequence2 {
            sort(step: step)
        }
    }
    
    private func sort(step: Int) {
        for column in 0..<step {
            for begin in stride(from: column + step, to: array.count, by: step) {
                var cur = begin
                while cur > column && cmp(cur, cur - step) < 0 {
                    swap(cur, cur - step)
                    cur -= step
                }
            }
        }
    }

    // 希尔步长序列 n / 2 ^ k (例：8、4、2、1)
    private func shellStepSequence() -> [Int] {
        var steps: [Int] = []
        var length = array.count >> 1
        while length > 0 {
            steps.append(length)
            length >>= 1
        }
        return steps
    }
    
    // 目前已知的最好的步长序列
    // 9 * (2 ^ k - 2 ^ (k / 2)) + 1  k偶数even
    // 8 * 2 ^ k - 6 * 2 ^ ((k + 1) / 2) + 1 k基数odd
    private func sedgewickStepSequence() -> [Int] {
        var steps: [Int] = []
        var k = 0, step = 0
        while step < array.count {
            if k % 2 == 0 {
                let p = Int(truncating: pow(2, k >> 1) as NSNumber)
                step = 9 * (p * p - p) + 1
            } else {
                let p1 = Int(truncating: pow(2, (k + 1) >> 1) as NSNumber)
                let p2 = Int(truncating: pow(2, (k - 1) >> 1) as NSNumber)
                step = 8 * p1 * p2 - 6 * p1 + 1
            }
            steps.insert(step, at: 0)
            k += 1
        }
        return steps
    }
}
