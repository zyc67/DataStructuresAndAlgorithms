//
//  LIS.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/6/11.
//

import Foundation
/*
 最长上升子序列（最长递增子序列，Longest Increasing Subsequence，LIS）
 leetcode_300_最长上升子序列： https://leetcode-cn.com/problems/longest-increasing-subsequence/
 给定一个无序的整数序列，求出它最长上升子序列的长度（要求严格上升）
 比如 [10, 2, 2, 5, 1, 7, 101, 18] 的最长上升子序列是 [2, 5, 7, 101]、[2, 5, 7, 18]，长度是 4
 
 
 假设数组是 nums， [10, 2, 2, 5, 1, 7, 101, 18]
  dp(i) 是以 nums[i] 结尾的最长上升子序列的长度，i ∈ [0, nums.length)
 ✓ 以 nums[0] 10 结尾的最长上升子序列是 10，所以 dp(0) = 1
 ✓ 以 nums[1] 2 结尾的最长上升子序列是 2，所以 dp(1) = 1
 ✓ 以 nums[2] 2 结尾的最长上升子序列是 2，所以 dp(2) = 1
 ✓ 以 nums[3] 5 结尾的最长上升子序列是 2、5，所以 dp(3) = dp(1) + 1 = dp(2) + 1 = 2
 ✓ 以 nums[4] 1 结尾的最长上升子序列是 1，所以 dp(4) = 1
 ✓ 以 nums[5] 7 结尾的最长上升子序列是 2、5、7，所以 dp(5) = dp(3) + 1 = 3
 ✓ 以 nums[6] 101 结尾的最长上升子序列是 2、5、7、101，所以 dp(6) = dp(5) + 1 = 4
 ✓ 以 nums[7] 18 结尾的最长上升子序列是 2、5、7、18，所以 dp(7) = dp(5) + 1 = 4
 ◼ 最长上升子序列的长度是所有 dp(i) 中的最大值 max { dp(i) }，i ∈ [0, nums.length)
 
 
 dp(i) 是以 nums[i] 结尾的最长上升子序列的长度，i ∈ [0, nums.length)
 ◼ 遍历 j ∈ [0, i)
  当 nums[i] > nums[j]
 ✓ nums[i] 可以接在 nums[j] 后面，形成一个比 dp(j) 更长的上升子序列，长度为 dp(j) + 1
 ✓ dp(i) = max { dp(i), dp(j) + 1 }
  当 nums[i] ≤ nums[j]
 ✓ nums[i] 不能接在 nums[j] 后面，跳过此次遍历（continue）
 ◼ 状态的初始值
  dp(0) = 1
  所有的 dp(i) 默认都初始化为 1
 */

class LIS {
    // 牌顶 二分搜索
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        // 牌堆的数量
        var len = 0
        // 牌顶数组
        var top = Array(repeating: 0, count: nums.count)
        
        for num in nums {
            var begin = 0
            var end = len
            while begin < end {
                let mid = (begin + end) >> 1
                if num <= top[mid] {
                    end = mid
                } else {
                    begin = mid + 1
                }
            }
            // 覆盖牌顶
            top[begin] = num
            // 检查是否要新建一个牌堆
            if begin == len  {
                len += 1
            }
        }
        return len
    }
    
    // 牌顶
    func lengthOfLIS1(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        // 牌堆的数量
        var len = 0
        // 牌顶数组
        var top = Array(repeating: 0, count: nums.count)
        
        for num in nums {
            var j = 0
            while j < len {
                if top[j] >= num {
                    top[j] = num
                    break
                }
                j += 1
            }
            // 新建一个牌堆
            if j == len {
                top[j] = num
                len += 1
            }
        }
        return len
    }
    
    // 动态规划
    func lengthOfLIS2(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var dp = Array(repeating: 0, count: nums.count)
        var m = dp[0]
        for i in 1..<dp.count {
            dp[i] = 1
            for j in 0..<i {
                if nums[i] <= nums[j] {
                    continue
                }
                dp[i] = max(dp[i], dp[j] + 1)
            }
            m = max(m, dp[i])
        }
        return m
    }
}
