//
//  LeetCode20.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2023/9/22.
//

/*
 20. 有效的括号 https://leetcode.cn/problems/valid-parentheses/description/
 
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 每个右括号都有一个对应的相同类型的左括号。
 */

import Foundation

class Solution_20 {
    func isValid(_ s: String) -> Bool {
        let dict = ["(": ")", "{": "}", "[": "]"]
        var items: [Character] = []
        for char in s {
            if dict.keys.contains(String(char)) { // 左括号
                items.append(char)
            } else { // 右括号
                if items.count == 0 {
                    return false
                }
                if String(char) != dict[String(items.removeLast())] {
                    return false
                }
            }
        }
        return items.count == 0
    }
}
