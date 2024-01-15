//
//  LeetCode349.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/1/15.
//

import Foundation

/*
 给定两个数组 nums1 和 nums2 ，返回 它们的交集 。输出结果中的每个元素一定是 唯一 的。我们可以 不考虑输出结果的顺序。
 */

class Solution_349 {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
//        if nums1.count > nums2.count {
//            return intersection(nums2, nums1)
//        }
//        let nums1Set = Set(nums1)
//        let nums2Set = Set(nums2)
//        
//        var interSet = Set<Int>()
//        for data in nums1Set {
//            if nums2Set.contains(data) {
//                interSet.insert(data)
//            }
//        }
//        return Array(interSet)
        return Array(Set(nums1).intersection(Set(nums2)))
    }
}
