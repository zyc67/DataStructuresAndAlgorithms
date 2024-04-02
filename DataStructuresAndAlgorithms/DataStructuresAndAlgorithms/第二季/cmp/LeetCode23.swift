//
//  LeetCode23.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/3/30.
//

import Foundation

/*
 合并 K 个升序链表
 
 给你一个链表数组，每个链表都已经按升序排列。

 请你将所有链表合并到一个升序链表中，返回合并后的链表。

  

 示例 1：

 输入：lists = [[1,4,5],[1,3,4],[2,6]]
 输出：[1,1,2,3,4,4,5,6]
 解释：链表数组如下：
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 将它们合并到一个有序链表中得到。
 1->1->2->3->4->4->5->6
 示例 2：

 输入：lists = []
 输出：[]
 示例 3：

 输入：lists = [[]]
 输出：[]
 */
class Solution_23 {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let s = Solution_21()
        var node: ListNode?
        for n in lists {
            node = s.mergeTwoLists(node, n)
        }
        return node
    }
}
