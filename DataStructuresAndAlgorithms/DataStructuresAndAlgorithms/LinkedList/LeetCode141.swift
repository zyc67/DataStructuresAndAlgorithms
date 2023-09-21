//
//  LeetCode141.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2023/9/20.
//

/*
 141. 环形链表 https://leetcode.cn/problems/linked-list-cycle/description/
 */

import Foundation

class Solution_141 {
    // 快慢指针
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return false
        }
        var slow = head
        var fast = head?.next
        
        while fast != nil, fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            // === 是比较两个对象的地址是否相等，不能用==是因为listNode不满足equalable协议
            if slow === fast {
                return true
            }
        }
        return false
    }
}
