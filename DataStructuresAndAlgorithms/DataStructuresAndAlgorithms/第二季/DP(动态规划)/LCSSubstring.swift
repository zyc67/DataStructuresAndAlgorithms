//
//  LCSSubstring.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/6/12.
//

import Foundation

extension String {
    subscript (_ i: Int) -> Character {
        get {
            return self[index(startIndex, offsetBy: i)]
        }
    }
}

/*
 最长公共子串（Longest Common Substring）
 子串是连续的子序列
 ◼ 求两个字符串的最长公共子串长度
 ABCBA 和 BABCA 的最长公共子串是 ABC，长度为 3
 
 ◼ 假设 2 个字符串分别是 str1、str2
  i ∈ [1, str1.length]
  j ∈ [1, str2.length]
 ◼ 假设 dp(i, j) 是以 str1[i– 1]、str2[j– 1] 结尾的最长公共子串长度
  dp(i, 0)、dp(0, j) 初始值均为 0
  如果 str1[i– 1] = str2[j– 1]，那么 dp(i, j) = dp(i– 1, j– 1) + 1
  如果 str1[i– 1] ≠ str2[j– 1]，那么 dp(i, j) = 0
 ◼ 最长公共子串的长度是所有 dp(i, j) 中的最大值 max { dp(i, j) }
 */

class LCSSubstring {
    func lcs(_ str1: String, _ str2: String) -> Int {
        if str1.count == 0 || str2.count == 0 {
            return 0
        }
        var dp = [[Int]](repeating: [Int](repeating: 0, count: str2.count + 1), count: str1.count + 1)
        var m = dp[0][0]
        for i in 1...str1.count {
            for j in 1...str2.count {
                if str1[i - 1] != str2[j - 1] {
                    continue
                }
                dp[i][j] = dp[i - 1][j - 1] + 1
                m = max(m, dp[i][j])
            }
        }
        return m
    }
}
