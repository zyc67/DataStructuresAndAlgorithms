//
//  LeetCode203.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2023/9/20.
//

/*
 203. 移除链表元素 https://leetcode.cn/problems/remove-linked-list-elements/description/
 给你一个链表的头节点 head 和一个整数 val ，请你删除链表中所有满足 Node.val == val 的节点，并返回 新的头节点 。
 */

import Foundation

class Solution_203 {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        if head == nil {
            return head
        }
        let newHead = ListNode(-1, head) // 增加一个虚拟头结点
        var prev: ListNode? = newHead
        while prev?.next != nil {
            if prev?.next?.val == val {
                prev?.next = prev?.next?.next
            } else {
                prev = prev?.next
            }
        }
        return newHead.next // 虚拟头结点的next一定是head
    }
}
