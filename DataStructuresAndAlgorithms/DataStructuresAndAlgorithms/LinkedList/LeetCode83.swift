//
//  LeetCode83.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2023/9/21.
//

/*
 83. 删除排序链表中的重复元素 https://leetcode.cn/problems/remove-duplicates-from-sorted-list/description/
 给定一个已排序的链表的头 head ， 删除所有重复的元素，使每个元素只出现一次 。返回 已排序的链表 。
 */

import Foundation

class Solution_83 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        var current = head
        // 链表已经排序，故相同的元素一定相连
        while current != nil, current?.next != nil {
            if current?.val == current?.next?.val {
                current?.next = current?.next?.next
            } else {
                current = current?.next
            }
        }
        return head
    }
}
