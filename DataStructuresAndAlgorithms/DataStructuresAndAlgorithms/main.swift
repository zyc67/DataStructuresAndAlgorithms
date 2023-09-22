//
//  main.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2023/9/18.
//

import Foundation

/*
// 单链表
var intList = VirtualHeadSingleLinkedList<Int>()
intList.add(11)
intList.add(22)
intList.add(33)
intList.add(44)
intList.set(1, 222)

intList.add(100, 55)
intList.add(2, 66)
intList.add(intList.size, 77)
intList.remove(0)
intList.remove(2)
intList.remove(intList.size - 1)
print(intList.indexOf(66))

class Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.age == rhs.age
    }
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


var pList = SingleLinkedList<Person>()
var p1 = Person(name: "a", age: 1)
var p2 = Person(name: "b", age: 2)
var p3 = Person(name: "b", age: 1)
pList.add(p1)
pList.add(p2)
print(pList.indexOf(p3))

*/

/*
// 删除链表中的节点
let s = Solution_237()
var node0 = ListNode(0, nil)
var node1 = ListNode(1, node0)
var node2 = ListNode(2, node1)
var node3 = ListNode(3, node2)
s.deleteNode(node2)
s.deleteNode(node3)
s.deleteNode(node0)
print(s)
*/


/*
// 反转链表

let s = Solution_206()
var node0 = ListNode(0, nil)
var node1 = ListNode(1, node0)
var node2 = ListNode(2, node1)
var node3 = ListNode(3, node2)
// 初始链表：3 -> 2 -> 1 -> 0 -> nil
//s.reverseList2(node3)
// 翻转后链表：0 -> 1 -> 2 -> 3 -> nil
*/

/*
// 环形链表
let s = Solution_141()
var node0 = ListNode(0, nil)
var node1 = ListNode(1, node0)
var node2 = ListNode(2, node1)
var node3 = ListNode(3, node2)
print(s.hasCycle(node3)) // false
node0.next = node2
print(s.hasCycle(node3)) // true
*/

/*
// 移除链表元素
let s = Solution_203()
var node0 = ListNode(6, nil)
var node1 = ListNode(5, node0)
var node2 = ListNode(4, node1)
var node3 = ListNode(3, node2)
var node4 = ListNode(6, node3)
var node5 = ListNode(2, node4)
var node6 = ListNode(1, node5)
let head = s.removeElements(node6, 1)
print(s)
*/

/*
// 删除排序链表中的重复元素
let s = Solution_83()
var node0 = ListNode(3, nil)
var node1 = ListNode(3, node0)
var node2 = ListNode(2, node1)
var node3 = ListNode(1, node2)
var node4 = ListNode(1, node3)
let head = s.deleteDuplicates(node4)
print(head)
*/

/*
// 双向链表
let intList = LinkedList<Int>()
intList.remove(0)
intList.add(11)
intList.add(22)
intList.add(33)
let i = intList.indexOf(22)
intList.remove(0)
intList.remove(intList.size - 1)
intList.add(44)
intList.add(55)
intList.add(66)
intList.set(1, 999)
let j = intList.get(0)
 */

/*
// 约瑟夫问题
let circle = CircleLinkedList<Int>()
for i in 1...8 {
    circle.add(i)
}
circle.reset()
while circle.size != 0 {
    circle.next()
    circle.next()
    print(circle.remove())
}
*/
