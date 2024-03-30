//
//  main.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2023/9/18.
//

import Foundation

// 第一季
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
// let s = BinarySearchTree<Int>()
let s = BST<Int>()
for e in array {
    s.add(e)
}
print(s)
//L---L---L---1
//L---L---2
//L---L---R---3
//L---4
//L---R---5
//7
//R---L---8
//R---9
//R---R---11
//R---R---R---12
//打印二叉树
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

 print(s.height())
 print(s.height2())
 print(s.isComplete())
 print(s.contains(8))
 print(s.contains(100))
 s.remove(5)
 print(s)
*/
/*
// AVLTree
// 3, 14, 15, 12, 11, 17, 16, 8, 9, 1
var s = AVLTree<Int>()
s.add(13)
print(s)
print("-----------")
s.add(14)
print(s)
print("-----------")
s.add(15)
print(s)
print("-----------")
s.add(12)
print(s)
print("-----------")
s.add(11)
print(s)
print("-----------")
s.add(17)
print(s)
print("-----------")
s.add(16)
print(s)
print("-----------")
s.add(8)
print(s)
print("-----------")
s.add(9)
print(s)
print("-----------")
s.add(1)
print(s)
print("-----------")
*/

/*
// RBTree
print("----------添加 RBTree--------------")
let data = [55, 87, 56, 74, 96, 22, 62, 20, 70, 68, 90, 50]
let rb = RBTree<Int>()
for i in data {
    rb.add(i)
    print(rb)
}

print("----------删除 RBTree--------------")
for i in data {
    rb.remove(i)
    print(rb)
}

/*
 ----------添加 RBTree--------------
 55
 -------- 打印二叉树 END --------
 55
 R---87(R)
 -------- 打印二叉树 END --------
 L---55(R)
 56
 R---87(R)
 -------- 打印二叉树 END --------
 L---55
 56
 R---L---74(R)
 R---87
 -------- 打印二叉树 END --------
 L---55
 56
 R---L---74(R)
 R---87
 R---R---96(R)
 -------- 打印二叉树 END --------
 L---L---22(R)
 L---55
 56
 R---L---74(R)
 R---87
 R---R---96(R)
 -------- 打印二叉树 END --------
 L---L---22(R)
 L---55
 56
 R---L---L---62(R)
 R---L---74
 R---87(R)
 R---R---96
 -------- 打印二叉树 END --------
 L---L---20(R)
 L---22
 L---R---55(R)
 56
 R---L---L---62(R)
 R---L---74
 R---87(R)
 R---R---96
 -------- 打印二叉树 END --------
 L---L---20(R)
 L---22
 L---R---55(R)
 56
 R---L---L---62(R)
 R---L---70
 R---L---R---74(R)
 R---87(R)
 R---R---96
 -------- 打印二叉树 END --------
 L---L---L---20(R)
 L---L---22
 L---L---R---55(R)
 L---56(R)
 L---R---62
 L---R---R---68(R)
 70
 R---L---74
 R---87(R)
 R---R---96
 -------- 打印二叉树 END --------
 L---L---L---20(R)
 L---L---22
 L---L---R---55(R)
 L---56(R)
 L---R---62
 L---R---R---68(R)
 70
 R---L---74
 R---87(R)
 R---R---L---90(R)
 R---R---96
 -------- 打印二叉树 END --------
 L---L---L---20
 L---L---22(R)
 L---L---R---L---50(R)
 L---L---R---55
 L---56
 L---R---62
 L---R---R---68(R)
 70
 R---L---74
 R---87
 R---R---L---90(R)
 R---R---96
 -------- 打印二叉树 END --------
 ----------删除 RBTree--------------
 L---L---L---20
 L---L---22(R)
 L---L---R---50
 L---56
 L---R---62
 L---R---R---68(R)
 70
 R---L---74
 R---87
 R---R---L---90(R)
 R---R---96
 -------- 打印二叉树 END --------
 L---L---L---20
 L---L---22(R)
 L---L---R---50
 L---56
 L---R---62
 L---R---R---68(R)
 70
 R---L---74
 R---90
 R---R---96
 -------- 打印二叉树 END --------
 L---L---L---20
 L---L---22(R)
 L---L---R---50
 L---62
 L---R---68
 70
 R---L---74
 R---90
 R---R---96
 -------- 打印二叉树 END --------
 L---L---20
 L---22
 L---R---50
 62
 R---L---68
 R---70
 R---R---90
 R---R---R---96(R)
 -------- 打印二叉树 END --------
 L---L---20
 L---22
 L---R---50
 62
 R---L---68
 R---70
 R---R---90
 -------- 打印二叉树 END --------
 L---L---20(R)
 L---50
 62
 R---L---68
 R---70(R)
 R---R---90
 -------- 打印二叉树 END --------
 L---L---20(R)
 L---50
 68
 R---70
 R---R---90(R)
 -------- 打印二叉树 END --------
 L---50
 68
 R---70
 R---R---90(R)
 -------- 打印二叉树 END --------
 L---50
 68
 R---90
 -------- 打印二叉树 END --------
 L---50(R)
 90
 -------- 打印二叉树 END --------
 50
 -------- 打印二叉树 END --------
 -------- 打印二叉树 END --------
 */
*/
/*
// 集合
let listSet = ListSet()
for i in 0..<10000 {
    listSet.add(element: i)
}

print(listSet.size())
for i in 0..<listSet.size() {
    print(listSet.list.get(i)!)
}
print("------------------")
let listTree = TreeSet()
for i in 0..<10000 {
    listTree.add(element: i)
}
print(listTree.size())
print(listTree.tree)
*/

/*
let s = Solution_349()
let inter = s.intersection([1, 4, 8, 6, 10, 8, 30, 8], [1, 3, 6, 8, 3])
print(inter)
*/

/*
let t = TreeMap<String, Int>()
_ = t.put(key: "c", value: 2)
_ = t.put(key: "a", value: 5)
_ = t.put(key: "b", value: 6)
_ = t.put(key: "a", value: 8)
print(t.getSize())
print(t.get(key: "a"))
print(t.get(key: "b"))
print(t.get(key: "d"))
print(t.get(key: "c"))
*/

/*
let h1 = BinaryHeap<Int>(elements: [88, 44, 53, 41, 16, 6, 70, 18, 85, 98, 23, 81, 36, 43, 37])
print(h1)

let h = BinaryHeap<Int>(elements: [])
h.add(88)
h.add(44)
h.add(53)
h.add(41)
h.add(16)
h.add(6)
h.add(70)
h.add(18)
h.add(85)
h.add(98)
h.add(23)
h.add(81)
h.add(36)
h.add(43)
h.add(37)
print(h) // 6 18 16 41 23 36 37 88 85 98 44 81 53 70 43
h.remove()
print(h) // [Optional(16), Optional(18), Optional(36), Optional(41), Optional(23), Optional(43), Optional(37), Optional(88), Optional(85), Optional(98), Optional(44), Optional(81), Optional(53), Optional(70), nil]
h.remove()
print(h) // [Optional(18), Optional(23), Optional(36), Optional(41), Optional(44), Optional(43), Optional(37), Optional(88), Optional(85), Optional(98), Optional(70), Optional(81), Optional(53), nil, nil]
h.remove()
print(h) // [Optional(23), Optional(41), Optional(36), Optional(53), Optional(44), Optional(43), Optional(37), Optional(88), Optional(85), Optional(98), Optional(70), Optional(81), nil, nil, nil]
h.remove()
print(h) // [Optional(36), Optional(41), Optional(37), Optional(53), Optional(44), Optional(43), Optional(81), Optional(88), Optional(85), Optional(98), Optional(70), nil, nil, nil, nil]
h.remove()
print(h) // [Optional(37), Optional(41), Optional(43), Optional(53), Optional(44), Optional(70), Optional(81), Optional(88), Optional(85), Optional(98), nil, nil, nil, nil, nil]
h.remove()
print(h) // [Optional(41), Optional(44), Optional(43), Optional(53), Optional(98), Optional(70), Optional(81), Optional(88), Optional(85), nil, nil, nil, nil, nil, nil]
*/

/*
// Top K问题
 
//小顶堆 -> 最大
// 新建一个小顶堆
let heap = BinaryHeap<Int>(elements: [])
// 找出最大的前k个数
let k = 3;
let data = [51, 30, 39, 92, 74, 25, 16, 93, 91, 19, 54, 47, 73, 62, 76, 63, 35, 18, 90, 6, 65, 49, 3, 26, 61, 21, 48]
for index in 0..<data.count {
    if heap.size < k { // 前k个数添加到小顶堆
        heap.add(data[index]) // logk
    } else if (data[index] > heap.get()!) { // 如果是第k + 1个数，并且大于堆顶元素
        _ = heap.replace(data[index]) // logk
    }
}
// O(nlogk)
print(heap)

//大顶堆 -> 最小
//for index in 0..<data.count {
//    if heap.size < k { // 前k个数添加到大顶堆
//        heap.add(data[index]) // logk
//    } else if (data[index] < heap.get()!) { // 如果是第k + 1个数，并且小于堆顶元素
//        _ = heap.replace(data[index]) // logk
//    }
//}
//// O(nlogk)
//print(heap)
 
*/

/*
// 优先级队列
var pq = PriorityQueue<Person>()
pq.enQueue(Person(name: "Jack", boneBreak: 2))
pq.enQueue(Person(name: "Rose", boneBreak: 10))
pq.enQueue(Person(name: "Jack", boneBreak: 5))
pq.enQueue(Person(name: "James", boneBreak: 15))
while !pq.isEmpty() {
    let p = pq.deQueue()
    print(p?.name, p?.boneBreak)
}
print(pq)
*/

/*
var trie = Trie<Int>()
trie.add("cat", 1);
trie.add("dog", 2);
trie.add("catalog", 3);
trie.add("cast", 4);
trie.add("小码哥", 5);
assert(trie.getSize() == 5)
assert(trie.startsWith("do"));
assert(trie.startsWith("c"));
assert(trie.startsWith("ca"));
assert(trie.startsWith("cat"));
assert(trie.startsWith("cata"));
assert(!trie.startsWith("hehe"));
assert(trie.get("小码哥") == 5);
assert(trie.remove("cat") == 1);
assert(trie.remove("catalog") == 3);
assert(trie.remove("cast") == 4);
assert(trie.getSize() == 2);
assert(trie.startsWith("小"));
assert(trie.startsWith("do"));
assert(!trie.startsWith("c"));
*/

// 第二季
//let array = [7, 3, 5, 8, 6, 7, 4, 5]
//var array: [Int] = []
//for _ in 0..<5000 {
//    array.append(Int.random(in: 0...100))
//}
//
//testSorts(array,
//          BubbleSort1(),
//          BubbleSort2(),
//          BubbleSort3(),
//          SelectionSort(),
//          HeapSort(),
//          InsertionSort1(),
//          InsertionSort2(),
//          InsertionSort3(),
//          MergeSort(),
//          QuickSort()
//)
//
//func testSorts(_ array: [Int], _ sorts: SortArray<Int>...) {
//    for s in sorts {
//        s.sortWith(array)
//        assert(Integers.isAscOrder(s.array))
////        print(s.array)
//        print(s)
//    }
//}

//let s = Solution_88_2()
//var nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
//var nums1 = [1], m = 1, nums2 = [Int](), n = 0
//var nums1 = [0], m = 0, nums2 = [1], n = 1
//var nums1 = [2, 0], m = 1, nums2 = [1], n = 1
//s.merge(&nums1, m, nums2, n)
//print(nums1)


//示例 1：
//输入：l1 = [1,2,4], l2 = [1,3,4]
//输出：[1,1,2,3,4,4]
//示例 2：
//
//输入：l1 = [], l2 = []
//输出：[]
//示例 3：
//
//输入：l1 = [], l2 = [0]
//输出：[0]
let s = Solution_21()
let node1 = ListNode(4)
let node2 = ListNode(2, node1)
let node3 = ListNode(1, node2)

let node4 = ListNode(4)
let node5 = ListNode(3, node4)
let node6 = ListNode(1, node5)
let node = s.mergeTwoLists(node3, node6)
print(node)

