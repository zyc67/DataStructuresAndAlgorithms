//
//  BinaryTree.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2023/9/28.
//

import Foundation

class BinaryTree<T>: CustomStringConvertible {
    class Node<E> {
        var element: E
        var parent: Node?
        var left: Node?
        var right: Node?
        
        init(element: E, parent: Node? = nil, left: Node? = nil, right: Node? = nil) {
            self.element = element
            self.parent = parent
            self.left = left
            self.right = right
        }
        
        // 是否是叶子结点
        func isLeaf() -> Bool {
            return left == nil && right == nil
        }
        
        // 是否有左右两个结点
        func hasTwoChildren() -> Bool {
            return left != nil && right != nil
        }
        
        // 是否是父结点的左子树
        func isLeftChild() -> Bool {
            return parent != nil && self === parent?.left
        }
        
        // 是否是父结点的右子树
        func isRightChild() -> Bool {
            return parent != nil && self === parent?.right
        }
        
        // 兄弟结点
        func sibling() -> Node? {
            if isLeftChild() {
                return parent?.right
            }
            if isRightChild() {
                return parent?.left
            }
            return nil
        }
    }
    
    var size: Int = 0
    var root: Node<T>?
    
    // MARK: 创建结点
    func createNode(element: T, parent: Node<T>? = nil) -> Node<T> {
        return Node(element: element, parent: parent)
    }
    
    // MARK: 是否为空
    func isEmpty() -> Bool {
        return size == 0
    }
    
    // MARK: 清空
    func clear() {
        root = nil
        size = 0
    }
    
    // ----------------------------- 四种遍历方法一 BEGIN -------------------------------------
    // MARK: 前序遍历 根左右
    func preorderTraversal() {
        preorderTraversal(root)
    }
    
    private func preorderTraversal(_ node: Node<T>?) {
        if node == nil { return }
        print(node!.element)
        preorderTraversal(node!.left)
        preorderTraversal(node!.right)
    }
    
    // MARK: 中序遍历 左根右
    func inorderTraversal() {
        inorderTraversal(root)
    }
    
    private func inorderTraversal(_ node: Node<T>?) {
        if node == nil { return }
        inorderTraversal(node!.left)
        print(node!.element)
        inorderTraversal(node!.right)
    }
    
    // MARK: 后序遍历 左右根
    func postorderTraversal() {
        postorderTraversal(root)
    }
    
    private func postorderTraversal(_ node: Node<T>?) {
        if node == nil { return }
        postorderTraversal(node!.left)
        postorderTraversal(node!.right)
        print(node!.element)
    }
    
    // MARK: 层序遍历 从上到下、从左到右访问每一个结点
    func levelOrderTraversal() {
        guard let root = root else { return }
        var list: [Node<T>] = []
        list.append(root)
        
        while list.count > 0 {
            let node = list.removeFirst()
            
            print(node.element)
            
            if node.left != nil {
                list.append(node.left!)
            }
            if node.right != nil {
                list.append(node.right!)
            }
        }
    }
    
    // ----------------------------- 四种遍历方法一 END -------------------------------------
    
    
    
    // ----------------------------- 四种遍历方法二 BEGIN -------------------------------------
    
    // MARK: 前序遍历
    func preorder(visitor: ConcretVisitor?) {
        if visitor == nil { return } // visitor写在这里只用判断一次即可，只要这里vistor != nil， 以后递归也就不会为nil，这样递归的时候就不用再重复判断了
        preorder(root, visitor!)
    }
    
    private func preorder(_ node: Node<T>?, _ visitor: ConcretVisitor) {
        if node == nil || visitor.stop { return } // visitor.stop退出递归
        visitor.stop = visitor.visitor(node!.element)
        preorder(node!.left, visitor)
        preorder(node!.right, visitor)
    }
    
    // MARK: 中序遍历
    func inorder(visitor: ConcretVisitor?) {
        if visitor == nil { return }
        inorder(root, visitor!)
    }
    
    private func inorder(_ node: Node<T>?, _ visitor: ConcretVisitor) {
        if node == nil || visitor.stop { return } // visitor.stop退出递归
        inorder(node!.left, visitor)
        if visitor.stop { return }
        visitor.stop = visitor.visitor(node!.element)
        inorder(node!.right, visitor)
    }
    
    // MARK: 后序遍历
    func postorder(visitor: ConcretVisitor?) {
        if visitor == nil { return }
        postorder(root, visitor!)
    }
    
    private func postorder(_ node: Node<T>?, _ visitor: ConcretVisitor) {
        if node == nil || visitor.stop { return } // visitor.stop退出递归
        postorder(node!.left, visitor)
        postorder(node!.right, visitor)
        if visitor.stop { return }
        visitor.stop = visitor.visitor(node!.element)
    }
    
    // MARK: 层序遍历
    func levelOrder(visitor: ConcretVisitor?) {
        guard let root = root else { return }
        guard let visitor = visitor else { return }
        var list: [Node<T>] = []
        list.append(root)
        
        while list.count > 0 {
            let node = list.removeFirst()
            
            if visitor.visitor(node.element) { return } // 退出while循环
            
            if node.left != nil {
                list.append(node.left!)
            }
            
            if node.right != nil {
                list.append(node.right!)
            }
        }
    }
    
    // ----------------------------- 四种遍历方法二 END -------------------------------------
    
    // MARK: 二叉树的高度
    // 层序遍历求高度 迭代
    func height() -> Int {
        guard let root = root else {
            return 0
        }
        var list: [Node<T>] = []
        list.append(root)
        var height = 0
        var levelSize = 1 // 每一层的结点数量
        
        while list.count > 0 {
            let node = list.removeFirst()
            levelSize -= 1
            
            if let left = node.left {
                list.append(left)
            }
            
            if let right = node.right {
                list.append(right)
            }
            
            if levelSize == 0 {
                // 当每一层的结点数量levelSize == 0表示盖层已经遍历完成，高度增加1，下一层的结点数量就是list的数量
                height += 1
                levelSize = list.count
            }
        }
        return height
    }
    
    // 递归
    func height2() -> Int {
        return height(root)
    }
    
    private func height(_ node: Node<T>?) -> Int {
        if node == nil {
            return 0
        }
        return 1 + max(height(node?.left), height(node?.right))
    }
    
    // MARK: 是否是完全二叉树
    func isComplete() -> Bool {
        guard let root = root else {
            return false
        }
        var leaf: Bool = false // 是否是叶子结点
        var list: [Node<T>] = []
        list.append(root)
        
        while list.count > 0 {
            let node = list.removeFirst()
            
            if leaf && !node.isLeaf() {
                return false
            }
            
            if let left = node.left {
                list.append(left)
            } else if let _ = node.right { // left == nil && right != nil
                return false
            }
            
            if let right = node.right {
                list.append(right)
            } else { // right == nil 后面遍历的节点都必须是叶子节点
                leaf = true
            }
        }
        return true
    }
    
    // MARK: 前驱结点: 中序遍历时的前一个结点
    func predecessor(_ node: Node<T>?) -> Node<T>? {
        guard let node = node else {
            return node
        }
        // 前驱结点在左子树当中，找node.left.right.right....
        var p = node.left
        if p != nil {
            while p!.right != nil {
                p = p!.right
            }
            return p!
        }
        // node.left == nil
        p = node
        while p!.parent != nil, p === p!.parent!.left {
            p = p!.parent
        }
        
        // node.parent == null
        // node == node.parent.right
        return p?.parent
    }
    
    // MARK: 后继结点: 中序遍历时的后一个结点
    func successor(_ node: Node<T>?) -> Node<T>? {
        guard let node = node else {
            return node
        }
        // 后继结点在右子树当中，找node.right.left.left....
        var p = node.right
        if p != nil {
            while p!.left != nil {
                p = p!.left
            }
            return p
        }
        // node.right == nil
        p = node
        while p!.parent != nil, p === p!.parent!.right {
            p = p!.parent
        }
        
        // node.parent == null
        // node == node.parent.left
        return p?.parent
    }
    
    var description: String {
        toString(root, preifx: "")
        return "-------- 打印二叉树 END --------"
    }
    
    //中序: 左 根 右
    func toString(_ node: Node<T>?, preifx: String) {
        if node == nil { return }
        toString(node?.left, preifx: preifx + "L---")
        print("\(preifx)\(node!.element)")
        toString(node?.right, preifx: preifx + "R---")
    }
}

protocol Visitor {
    var stop: Bool { set get }
    func visitor(_ element: Any) -> Bool
}

class ConcretVisitor: Visitor {
    var stop: Bool
    
    func visitor(_ element: Any) -> Bool {
        return false
    }
    
    init(stop: Bool) {
        self.stop = stop
    }
}
