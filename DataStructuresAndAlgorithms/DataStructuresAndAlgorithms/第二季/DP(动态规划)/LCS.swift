//
//  LCS.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/6/12.
//

import Foundation

/*
 最长公共子序列（Longest Common Subsequence，LCS）
 leetcode_1143_最长公共子序列：https://leetcode-cn.com/problems/longest-common-subsequence/
 求两个序列的最长公共子序列长度
 [1, 3, 5, 9, 10] 和 [1, 4, 9, 10] 的最长公共子序列是 [1, 9, 10]，长度为 3
 ABCBDAB 和 BDCABA 的最长公共子序列长度是 4，可能是
✓ ABCBDAB 和 BDCABA > BDAB
✓ ABCBDAB 和 BDCABA > BDAB
✓ ABCBDAB 和 BDCABA > BCAB
✓ ABCBDAB 和 BDCABA > BCBA
 
 ◼ 假设 2 个序列分别是 nums1、nums2
  i ∈ [1, nums1.length]
  j ∈ [1, nums2.length]
 ◼ 假设 dp(i, j) 是【nums1 前 i 个元素】与【nums2 前 j 个元素】的最长公共子序列长度
  dp(i, 0)、dp(0, j) 初始值均为 0
  如果 nums1[i– 1] = nums2[j– 1]，那么 dp(i, j) = dp(i– 1, j– 1) + 1
  如果 nums1[i– 1] ≠ nums2[j– 1]，那么 dp(i, j) = max { dp(i– 1, j), dp(i, j– 1) }
 
 */

class LCS {
    func lcs(_ nums1: [Int], _ nums2: [Int]) -> Int {
        if nums1.count == 0 || nums2.count == 0 {
            return 0
        }
        var rowsNums = nums1
        var colsNums = nums2
        if nums1.count < nums2.count {
            rowsNums = nums2
            colsNums = nums1
        }
        var dp = [Int](repeating: 0, count: colsNums.count + 1)
        var leftTop = 0
        for i in 1...rowsNums.count {
            for j in 1...colsNums.count {
                leftTop = dp[j]
                if rowsNums[i - 1] == colsNums[j - 1] {
                    dp[j] = leftTop + 1
                } else {
                    dp[j] = max(dp[j - 1], dp[j])
                }
            }
        }
        return dp[colsNums.count]
    }
    
    func lcs5(_ nums1: [Int], _ nums2: [Int]) -> Int {
        if nums1.count == 0 || nums2.count == 0 {
            return 0
        }
        var dp = [Int](repeating: 0, count: nums2.count + 1)
        var leftTop = 0
        for i in 1...nums1.count {
            for j in 1...nums2.count {
                leftTop = dp[j]
                if nums1[i - 1] == nums2[j - 1] {
                    dp[j] = leftTop + 1
                } else {
                    dp[j] = max(dp[j - 1], dp[j])
                }
            }
        }
        return dp[nums2.count]
    }
    
    func lcs4(_ nums1: [Int], _ nums2: [Int]) -> Int {
        if nums1.count == 0 || nums2.count == 0 {
            return 0
        }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: nums2.count + 1), count: 2)
        for i in 1...nums1.count {
            let row = i & 1
            let prevRow = (i - 1) & 1
            for j in 1...nums2.count {
                if nums1[i - 1] == nums2[j - 1] {
                    dp[row][j] = dp[prevRow][j - 1] + 1
                } else {
                    dp[row][j] = max(dp[row][j - 1], dp[prevRow][j])
                }
            }
        }
        return dp[nums1.count & 1][nums2.count]
    }
    
    func lcs3(_ nums1: [Int], _ nums2: [Int]) -> Int {
        if nums1.count == 0 || nums2.count == 0 {
            return 0
        }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: nums2.count + 1), count: 2)
        for i in 1...nums1.count {
            for j in 1...nums2.count {
                if nums1[i - 1] == nums2[j - 1] {
                    dp[i % 2][j] = dp[(i - 1) % 2][j - 1] + 1
                } else {
                    dp[i % 2][j] = max(dp[i % 2][j - 1], dp[(i - 1) % 2][j])
                }
            }
        }
        return dp[nums1.count % 2][nums2.count]
    }
    
    func lcs2(_ nums1: [Int], _ nums2: [Int]) -> Int {
        if nums1.count == 0 || nums2.count == 0 {
            return 0
        }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: nums2.count + 1), count: nums1.count + 1)
        for i in 1...nums1.count {
            for j in 1...nums2.count {
                if nums1[i - 1] == nums2[j - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + 1
                } else {
                    dp[i][j] = max(dp[i][j - 1], dp[i - 1][j])
                }
            }
        }
        print(dp)
        return dp[nums1.count][nums2.count]
    }
    
    
    func lcs1(_ nums1: [Int], _ nums2: [Int]) -> Int {
        if nums1.count == 0 || nums2.count == 0 {
            return 0
        }
        return lcs1(nums1, nums1.count, nums2, nums2.count)
    }
    
    // 求nums1前i个元素和nums2前j个元素的最长公共子序列长度
    func lcs1(_ nums1: [Int], _ i: Int, _ nums2: [Int], _ j: Int) -> Int {
        if i == 0 || j == 0 {
            return 0
        }
        if nums1[i - 1] == nums2[j - 1] {
            return lcs1(nums1, i - 1, nums2, j - 1) + 1
        }
        return max(lcs1(nums1, i, nums2, j - 1), lcs1(nums1, i - 1, nums2, j))
    }
}
