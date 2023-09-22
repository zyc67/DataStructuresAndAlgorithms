//
//  LeetCode876.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2023/9/21.
//

/*
 876. 链表的中间结点 https://leetcode.cn/problems/middle-of-the-linked-list/description/
 给你单链表的头结点 head ，请你找出并返回链表的中间结点。
 如果有两个中间结点，则返回第二个中间结点。
 */

import Foundation

class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        // 快慢指针
        if head == nil || head?.next == nil {
            return head
        }
        var fast = head
        var slow = head
        
        while fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
}


// 1 2 3 4 5 6 7 8 9 0
//     3   5   7   9   *
//   2 3 4 5 6
