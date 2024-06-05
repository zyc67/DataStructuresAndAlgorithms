//
//  MaxSubArray.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/6/5.
//

import Foundation

/*
 leetcode_53_最大子序和：https://leetcode-cn.com/problems/maximum-subarray/
 给定一个长度为 n 的整数序列，求它的最大连续子序列和
 比如 –2、1、–3、4、–1、2、1、–5、4 的最大连续子序列和是 4 + (–1) + 2 + 1 = 6
 子串、子数组、子区间必须是连续的，子序列是可以不连续的
 */

class MaxSubArray {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        return maxSubArray(nums, 0, nums.count)
    }
    
    func maxSubArray(_ nums: [Int], _ begin: Int, _ end: Int) -> Int {
        if end - begin < 2 {
            return nums[begin]
        }
        let mid: Int = (begin + end) >> 1
        
        var leftMax = nums[mid - 1]
        var leftSum = leftMax
        for i in stride(from: mid - 2, through: begin, by: -1) {
            leftSum += nums[i]
            leftMax = max(leftMax, leftSum)
        }
        
        var rightMax = nums[mid]
        var rightSum = rightMax
        for i in (mid + 1)..<end {
            rightSum += nums[i]
            rightMax = max(rightMax, rightSum)
        }
        // 最大连续子序列和有三种情况
        // 1.一部分在[begin, mid)中，一部分在[mid, end)中
        // 2.在[begin, mid)中
        // 3.在[mid, end)中
        return max(leftMax + rightMax, maxSubArray(nums, begin, mid), maxSubArray(nums, mid, end))
    }
}
