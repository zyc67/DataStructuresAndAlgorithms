//
//  LeetCode856.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2023/9/22.
//

/*
 856. 括号的分数 https://leetcode.cn/problems/score-of-parentheses/description/
 
 给定一个平衡括号字符串 S，按下述规则计算该字符串的分数：

 () 得 1 分。
 AB 得 A + B 分，其中 A 和 B 是平衡括号字符串。
 (A) 得 2 * A 分，其中 A 是平衡括号字符串。
  

 示例 1：

 输入： "()"
 输出： 1
 示例 2：

 输入： "(())"
 输出： 2
 示例 3：

 输入： "()()"
 输出： 2
 示例 4：

 输入： "(()(()))"
 输出： 6
 */

// MARK: TODO
import Foundation
class Solution_856 {
    func scoreOfParentheses(_ s: String) -> Int {
        var st = [0]
        for char in s {
            if char == "(" {
                st.append(0)
            } else {
                let v = st.removeLast()
                let top = st.removeLast() + max(2 * v, 1)
                st.append(top)
            }
        }
        return st.first ?? 0
    }
}
