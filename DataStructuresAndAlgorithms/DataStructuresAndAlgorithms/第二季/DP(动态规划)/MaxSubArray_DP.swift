//
//  MaxSubArray_DP.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/6/7.
//

import Foundation

/*
 leetcode_53_最大子序和：https://leetcode-cn.com/problems/maximum-subarray/
 给定一个长度为 n 的整数序列，求它的最大连续子序列和
 比如 –2、1、–3、4、–1、2、1、–5、4 的最大连续子序列和是 4 + (–1) + 2 + 1 = 6
 子串、子数组、子区间必须是连续的，子序列是可以不连续的
 */

class MaxSubArray_DP {
    /*
     空间复杂度：O(1)，时间复杂度：O(n)
     */
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        
        var dp = nums[0]
        var m = nums[0]
        for i in 1..<nums.count {
            if dp > 0 {
                dp += nums[i]
            } else {
                dp = nums[i]
            }
            m = max(m, dp)
        }
        return m
    }
    
    /*
     dp(i) 是以 nums[i] 结尾的最大连续子序列和
     ◼ 状态转移方程
     如果 dp(i – 1) ≤ 0，那么 dp(i) = nums[i]
     如果 dp(i – 1) > 0，那么 dp(i) = dp(i – 1) + nums[i]
     ◼ 初始状态
     dp(0) 的值是 nums[0]
     ◼ 最终的解
     最大连续子序列和是所有 dp(i) 中的最大值 max { dp(i) }，i ∈ [0, nums.length)
     
     ◼ 空间复杂度：O(n)，时间复杂度：O(n)
     */
    func maxSubArray1(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var dp = Array(repeating: 0, count: nums.count)
        dp[0] = nums[0]
        var m = nums[0]
        for i in 1..<nums.count {
            let prev = dp[i - 1]
            if prev > 0 {
                dp[i] = prev + nums[i]
            } else {
                dp[i] = nums[i]
            }
            m = max(m, dp[i])
        }
        return m
    }
}
