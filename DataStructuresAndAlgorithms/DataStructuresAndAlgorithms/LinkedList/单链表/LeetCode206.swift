//
//  LeetCode206.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2023/9/19.
//

/*
 206. 反转链表 ttps://leetcode.cn/problems/reverse-linked-list/description/
 给你单链表的头节点 `head` ，请你反转链表，并返回反转后的链表。
 */

import Foundation

class Solution_206 {
    // 递归
    func reverseList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { // 空链表或者只有一个结点直接return
            return head
        }
        let newHead = reverseList(head?.next) // 已经翻转
        head?.next?.next = head // 已经翻转过的链表的最后一个结点（即head.next）的next指向头结点
        head?.next = nil // 将头结点的next置为nil
        return newHead
    }
    // 迭代
    func reverseList2(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { // 空链表或者只有一个结点直接return
            return head
        }
        var tempHead = head
        var newHead: ListNode?
        while tempHead != nil {
            let temp = tempHead?.next
            tempHead?.next = newHead
            newHead = tempHead
            tempHead = temp
        }
        return newHead
    }
}

// 1 2
// 1.next.next = 1, 1.next = null -> 2.next = 1, 1.next = null

// 1 2 3
// head = 3
// 1.next.next = 1, 1.next = null -> 2.next = 1, 1.next = null
// 2.next.next = 2, 2.next = null -> 3.next = 2, 2.next = null

// 1 2 3 4
// head = 4
// 1.next.next = 1, 1.next = null -> 2.next = 1, 1.next = null
// 2.next.next = 2, 2.next = null -> 3.next = 2, 2.next = null
// 3.next.next = 3, 3.next = null -> 4.next = 3, 3.next = null
