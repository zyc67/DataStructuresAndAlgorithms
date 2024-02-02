//
//  TreeMap.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/1/15.
//

import Foundation

class TreeMap<K: Comparable, V: Comparable> {
    enum RBColor {
        case RED
        case BLACK
    }
    
    var size: Int = 0
    var root: Node?

    func getSize() -> Int {
        return size
    }
    
    func isEmpty() -> Bool {
        size == 0
    }
    
    func clear() {
        root = nil
        size = 0
    }
    
    func put(key: K, value: V) -> V? {
        if root == nil { // 添加的第一个元素（根结点）
            root = Node(key: key, value: value)
            size = 1
            afterPut(root!)
            return nil
        }
        var node = root
        var parent = root
        var cmp = 0
        while node != nil {
            cmp = compare(e1: key, e2: node!.key as K)
            parent = node
            if cmp < 0 {
                node = node!.left
            } else if cmp > 0 {
                node = node!.right
            } else {
                node!.key = key
                let oldValue = node!.value
                node!.value = value
                return oldValue as V
            }
        }
        
        let newNode = Node(key: key, value: value, parent: parent)
        if cmp > 0 {
            parent!.right = newNode
        } else {
            parent!.left = newNode
        }
        size += 1
        afterPut(newNode)
        return nil
    }
    
    func get(key: K) -> V? {
        let node = node(key)
        return node != nil ? node!.value : nil
    }
    
    func remove(key: K) -> V? {
        return remove(node: node(key))
    }
    
    func containsKey(key: K) -> Bool {
        return node(key) != nil
    }
    
    func containsValue(value: V) -> Bool {
        guard let root = root else {
            return false
        }
        var list: [Node] = []
        list.append(root)
        
        while list.count > 0 {
            let node = list.removeFirst()
            if node.value == value {
                return true
            }
            if node.left != nil {
                list.append(node.left!)
            }
            if node.right != nil {
                list.append(node.right!)
            }
        }
        return false
    }

    private func remove(node: Node?) -> V? {
        guard var node = node else { return nil }
        let oldValue = node.value
        size -= 1
        if node.hasTwoChildren() {
            // 度为2的结点 找到前驱或者后继结点，覆盖原结点的值，再删除前驱或者后继结点
            // 如果一个结点的度为2，那么它的前驱或者后继结点的度为0或1
            
            // 找到后继节点
            let next = successor(node)
            // 用后继节点的值覆盖度为2的节点的值
            node.key = next!.key
            node.value = next!.value
            // 删除后继节点
            node = next!
        }
        
        // 删除node节点（node的度必然是1或者0）
        let replacement = node.left != nil ? node.left : node.right
        // 度为1的结点
        if replacement != nil {
            replacement!.parent = node.parent
            if node.parent == nil { // node是度为1的节点并且是根节点
                root = replacement
            } else if node === node.parent!.left {
                node.parent!.left = replacement
            } else { // node == node.parent.right
                node.parent!.right = replacement
            }
            // 删除节点之后的处理
            afterRemove(node, replacement)
        } else if node.parent == nil { // node是叶子节点并且是根节点
            root = nil
            // 删除节点之后的处理
            afterRemove(node)
        } else { // node是叶子节点，但不是根节点
            if node === node.parent!.left {
                node.parent!.left = nil
            } else { // node == node.parent.right
                node.parent!.right = nil
            }
            // 删除节点之后的处理
            afterRemove(node)
        }
        return oldValue
    }
    
    // MARK: 后继结点: 中序遍历时的后一个结点
    private func successor(_ node: Node?) -> Node? {
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
    
    // MARK: 根据结点元素查找结点
    private func node(_ key: K) -> Node? {
        var node = root
        while node != nil {
            let cmp = compare(e1: key, e2: node!.key as K)
            if cmp == 0 {
                return node
            } else if cmp < 0 {
                node = node!.left
            } else {
                node = node!.right
            }
        }
        return nil
    }
    
    private func afterPut(_ node: Node) {
        let parent: Node? = node.parent
        guard let parent = parent else {
            // 添加的是根节点 或者 上溢到达了根节点
            _ = black(node: node)
            return
        }
        // 如果父节点是黑色，直接返回
        if isBlack(node: parent) { return }
    
        // 红<-黑->红 黑->红 红<-黑 黑
        
        // 叔父结点
        let uncle: Node? = parent.sibling()
        let grand: Node? = red(node: parent.parent)
        if isRed(node: uncle) { // 叔父节点是红色【B树节点上溢】
            _ = black(node: parent)
            _ = black(node: uncle)
            afterPut(grand!)
            return
        }
        
        // 叔父节点不是红色
        if parent.isLeftChild() { // L 红<-黑
            if node.isLeftChild() { // LL
                _ = black(node: parent)
            } else { // LR
                _ = black(node: node)
                rotateLeft(parent)
            }
            rotateRight(grand!)
        } else { // R 黑->红
            if node.isLeftChild() { // RL
                _ = black(node: node)
                rotateRight(parent)
            } else { // RR
                _ = black(node: parent)
            }
            rotateLeft(grand!)
        }
    }
    
    private func afterRemove(_ node: Node, _ replacement: Node? = nil) {
        // 如果删除的节点是红色
        if isRed(node: node) {
            return
        }
        
        // 用以取代删除节点的子节点是红色
        if (isRed(node: replacement)) {
            _ = black(node: replacement)
            return
        }
        
        let parent = node.parent
        // 删除的是根节点
        guard let parent = parent else {
            return
        }
        
        // 删除的是黑色叶子节点【下溢】
        // 判断被删除的node是左还是右
        let left = parent.left == nil || node.isLeftChild()
        var sibling = left ? parent.right : parent.left
        if (left) { // 被删除的节点在左边，兄弟节点在右边
            if isRed(node: sibling) { // 兄弟节点是红色
                _ = black(node: sibling)
                _ = red(node: parent)
                rotateLeft(parent)
                sibling = parent.right
            }
            
            // 兄弟节点必然是黑色
            if isBlack(node: sibling?.left) && isBlack(node: sibling?.right) { // 兄弟节点没有1个红色子节点，父节点要向下跟兄弟节点合并
                let parentBlack = isBlack(node: parent)
                _ = black(node: parent)
                _ = red(node: sibling)
                if parentBlack {
                    afterRemove(parent)
                }
            } else { // 兄弟节点至少有1个红色子节点，向兄弟节点借元素
                if isBlack(node: sibling?.right) { // 兄弟节点的左边是黑色，兄弟要先旋转
                    rotateRight(sibling!)
                    sibling = parent.right
                }
                _ = renderColor(colorOf(node: parent), node: sibling)
                _ = black(node: sibling?.right)
                _ = black(node: parent)
                rotateLeft(parent)
            }
        } else { // 被删除的节点在右边，兄弟节点在左边
            if isRed(node: sibling) { // 兄弟节点是红色
                _ = black(node: sibling)
                _ = red(node: parent)
                rotateRight(parent)
                sibling = parent.left
            }
            
            // 兄弟节点必然是黑色
            if isBlack(node: sibling?.left) && isBlack(node: sibling?.right) { // 兄弟节点没有1个红色子节点，父节点要向下跟兄弟节点合并
                let parentBlack = isBlack(node: parent)
                _ = black(node: parent)
                _ = red(node: sibling)
                if parentBlack {
                    afterRemove(parent)
                }
            } else { // 兄弟节点至少有1个红色子节点，向兄弟节点借元素
                if isBlack(node: sibling?.left) { // 兄弟节点的左边是黑色，兄弟要先旋转
                    rotateLeft(sibling!)
                    sibling = parent.left
                }
                _ = renderColor(colorOf(node: parent), node: sibling)
                _ = black(node: sibling?.left)
                _ = black(node: parent)
                rotateRight(parent)
            }
        }
    }
    
    private func rotateLeft(_ grand: Node) {
        let parent = grand.right!
        let child = parent.left
        grand.right = child
        parent.left = grand
        afterRotate(grand: grand, parent: parent, child: child)
    }
    
    private func rotateRight(_ grand: Node) {
        let parent = grand.left!
        let child = parent.right
        grand.left = child
        parent.right = grand
        afterRotate(grand: grand, parent: parent, child: child)
    }
    
    private func afterRotate(grand: Node, parent: Node, child: Node?) {
        // 让parent称为子树的根节点
        parent.parent = grand.parent
        if grand.isLeftChild() {
            grand.parent?.left = parent
        } else if grand.isRightChild() {
            grand.parent?.right = parent
        } else {
            root = parent
        }
        // 更新child的parent
        child?.parent = grand
        // 更新grand的parent
        grand.parent = parent
    }
    
    // MARK: 染色
    private func renderColor(_ color: RBColor, node: Node?) -> Node? {
        guard let node = node else {
            return node
        }
        node.color = color
        return node
    }
    
    private func red(node: Node?) -> Node? {
        return renderColor(RBColor.RED, node: node)
    }
    
    private func black(node: Node?) -> Node? {
        return renderColor(RBColor.BLACK, node: node)
    }
    
    private func colorOf(node: Node?) -> RBColor {
        return node == nil ? RBColor.BLACK : node!.color
    }
    
    private func isBlack(node: Node?) -> Bool {
        return colorOf(node: node) == RBColor.BLACK
    }
    
    private func isRed(node: Node?) -> Bool {
        return colorOf(node: node) == RBColor.RED
    }
    
    private func compare(e1: K, e2: K) -> Int {
        if e1 < e2 {
            return -1
        } else if e1 > e2 {
            return 1
        }
        return 0
    }
    
    class Node {
        var key: K
        var value: V
        var color: RBColor = .RED
        
        var parent: Node?
        var left: Node?
        var right: Node?
        
        init(key: K, value: V, parent: Node? = nil, left: Node? = nil, right: Node? = nil) {
            self.key = key
            self.value = value
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
    
}
