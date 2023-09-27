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
class Person {
//    static func == (lhs: Person, rhs: Person) -> Bool {
//        lhs.age == rhs.age
//    }
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
let pList = LinkedList<Person>()
var p1 = Person(name: "a", age: 1)
var p2 = Person(name: "b", age: 2)
var p3 = Person(name: "b", age: 1)
pList.add(p1)
pList.add(p2)
pList.add(p3)
let i = pList.indexOf(p3) // Referencing instance method 'indexOf' on 'LinkedList' requires that 'Person' conform to 'Equatable'
pList.remove(0)


//let intList = LinkedList<Int>()
//intList.remove(0)
//intList.add(11)
//intList.add(22)
//intList.add(33)
//let i = intList.indexOf(33)
//intList.remove(0)
//intList.remove(intList.size - 1)
//intList.add(44)
//intList.add(55)
//intList.add(66)
//intList.set(1, 999)
//let j = intList.get(0)

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

/*
// 栈
let stack = Stack<Int>()
//let stack = Stack2<Int>()
print(stack.size())
print(stack.pop())
print(stack.top())
print(stack.isEmpty())
stack.push(0)
print(stack.isEmpty())
stack.push(1)
stack.push(2)
print(stack.pop())
print(stack.top())
stack.push(1)
stack.push(3)
stack.push(4)
print(stack.top())
print(stack.isEmpty())
*/

/*
// 有效的括号
let s = Solution_20()
print(s.isValid("(]"))
print(s.isValid("()"))
print(s.isValid("()[]{}"))
*/

/*
// 括号的分数
let s = Solution_856()
//print(s.scoreOfParentheses("()"))
//print(s.scoreOfParentheses("(())"))
//print(s.scoreOfParentheses("()()"))
print(s.scoreOfParentheses("((())(()))"))
 */

/*
// 逆波兰表达式求值
let s = Solution_150()
let tokens1 = ["2","1","+","3","*"] // 9
let tokens2 = ["4","13","5","/","+"] // 6
let tokens3 = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"] // 22
print(s.evalRPN(tokens1))
print(s.evalRPN(tokens2))
print(s.evalRPN(tokens3))
 */

/*
// 队列
let queue = Queue<Any>()
queue.enQueue(11)
queue.enQueue(22)
queue.enQueue(33)
queue.enQueue(44)
queue.enQueue(true)
queue.enQueue(0.1)
while !queue.isEmpty() {
    print(queue.deQueue() as Any)
}


let deque = Deque<Any>()
deque.enQueueFront(11)
deque.enQueueFront(22)
deque.enQueueRear(33)
deque.enQueueRear(44)

// 头 22 11 33 44尾
while !deque.isEmpty() {
//    print(deque.deQueueFront())
    print(deque.deQueueRear())
}


// 循环队列
let circleQueue = CircleQueue<Any>()
// 0 1 2 3 4 5 6 7 8 9
for i in 0..<10 {
    circleQueue.enQueue(i)
}
// nil nil nil nil nil 5 6 7 8 9
for _ in 0..<5 {
    circleQueue.deQueue()
}
// 15 16 17 18 19 5 6 7 8 9
for i in 15..<20 {
    circleQueue.enQueue(i)
}
print(circleQueue.front()) // 5
while !circleQueue.isEmpty() {
    print(circleQueue.deQueue())
}

let circleDeque = CircleDeque<Any>()
// 头5 4 3 2 1 100 101 102 103 104尾
// 头5 4 3 2 1 100 101 102 103 104 nil nil nil nil nil尾
// 头5 4 3 2 1 100 101 102 103 104 105 106 8 7 6尾
// 头8 7 6 5 4 3 2 1 100 101 102 103 104 105 106 nil nil nil nil nil nil nil尾
// 头8 7 6 5 4 3 2 1 100 101 102 103 104 105 106 107 108 109 nil nil 10 9尾
for i in 0..<10 {
    circleDeque.enQueueFront(i + 1)
    circleDeque.enQueueRear(i + 100)
}

circleDeque.frontIndex // 20

// 头nil 7 6 5 4 3 2 1 100 101 102 103 104 105 106 nil nil nil nil nil nil nil尾
for i in 0..<3 {
    circleDeque.deQueueFront()
    circleDeque.deQueueRear()
}



// 头11 7 6 5 4 3 2 1 100 101 102 103 104 105 106 nil nil nil nil nil nil 12尾
circleDeque.enQueueFront(11)
circleDeque.enQueueFront(12)

circleDeque.frontIndex // 21
while !circleDeque.isEmpty() {
    print(circleDeque.deQueueFront())
}
 
 */

/*
// 用队列实现栈
let s = MyStack_225()
s.push(1)
s.push(2)
s.push(3)
s.pop()
s.push(4)
let top = s.top()
let isEmpty = s.empty()
s.pop()
s.pop()
s.pop()
let isEmpty2 = s.empty()
s.push(1)
s.push(2)
 */

/*
 // 二叉搜索树
 class Person: Comparable, CustomStringConvertible {
 var description: String {
 return "name = \(name), age = \(age)"
 }
 
 static func < (lhs: Person, rhs: Person) -> Bool {
 return lhs.age < rhs.age
 }
 
 static func == (lhs: Person, rhs: Person) -> Bool {
 return lhs.age == rhs.age
 }
 
 var name: String
 var age: Int
 
 init(name: String, age: Int) {
 self.name = name
 self.age = age
 }
 
 
 }
 
 //let s = BinarySearchTree<Int>()
 //s.add(10)
 //s.add(12)
 //s.add(9)
 //s.add(6)
 //s.add(15)
 //s.add(20)
 //print(s)
 
 let s = BinarySearchTree<Person>()
 var p1 = Person(name: "a", age: 10)
 var p2 = Person(name: "b", age: 12)
 var p3 = Person(name: "a", age: 9)
 var p4 = Person(name: "b", age: 6)
 var p5 = Person(name: "a", age: 15)
 var p6 = Person(name: "b", age: 20)
 s.add(p1)
 s.add(p2)
 s.add(p3)
 s.add(p4)
 s.add(p5)
 s.add(p6)
 
 */

/*
// 二叉搜索树遍历
let array = [7, 4, 9, 2, 5, 8, 11, 3, 12, 1]
let s = BinarySearchTree<Int>()
for e in array {
    s.add(e)
}
s.preorderTraversal() // 7, 4, 2, 1, 3, 5, 9, 8, 11, 12
print("------------------")
s.inorderTraversal() // 1, 2, 3, 4, 5, 7, 8, 9, 11, 12
print("------------------")
s.postorderTraversal() // 1, 3, 2, 5, 4, 8, 12, 11, 9, 7
print("------------------")
s.levelOrderTraversal() // 7, 4, 9, 2, 5, 8, 11, 1, 3, 12
print("------------------")


// Visitor 二叉搜索树遍历
class PreorderVisitor: ConcretVisitor {
    override func visitor(_ element: Any) -> Bool {
        let result = element as! Int
        print("前序遍历：", result)
        return result == 9
    }
}

class InorderVisitor: ConcretVisitor {
    override func visitor(_ element: Any) -> Bool {
        let result = element as! Int
        print("中序遍历：", result)
        return result == 7
    }
}

class PostorderVisitor: ConcretVisitor {
    override func visitor(_ element: Any) -> Bool {
        let result = element as! Int
        print("后序遍历：", result)
        return result == 12
    }
}

class LevelOrderVisitor: ConcretVisitor {
    override func visitor(_ element: Any) -> Bool {
        let result = element as! Int
        print("层序遍历：", result)
        return result == 1
    }
}

s.preorder(visitor: PreorderVisitor(stop: false))
s.inorder(visitor: InorderVisitor(stop: false))
s.postorder(visitor: PostorderVisitor(stop: false))
s.levelOrder(visitor: LevelOrderVisitor(stop: false))
 */
