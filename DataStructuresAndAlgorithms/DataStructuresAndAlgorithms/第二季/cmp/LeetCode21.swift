//
//  LeetCode21.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/3/30.
//

import Foundation

/*
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 
 示例 1：
 输入：l1 = [1,2,4], l2 = [1,3,4]
 输出：[1,1,2,3,4,4]
 示例 2：

 输入：l1 = [], l2 = []
 输出：[]
 示例 3：

 输入：l1 = [], l2 = [0]
 输出：[0]
 */

class Solution_21 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        
        if list1 == nil {
            return list2
        }
        if list2 == nil {
            return list1
        }
        
        var p1 = list1
        var p2 = list2
        
        let firstNode = ListNode()
        var node = firstNode
        
        while p1 != nil && p2 != nil {
            if p1!.val <= p2!.val {
                node.next = p1
                p1 = p1!.next
            } else {
                node.next = p2
                p2 = p2!.next
            }
            node = node.next!
        }
        node.next = p1 == nil ? p2 : p1
        
        return firstNode.next
    }
}
