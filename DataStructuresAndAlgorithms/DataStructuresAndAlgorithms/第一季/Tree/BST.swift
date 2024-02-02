//
//  BST.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2023/9/28.
//

import Foundation

class BST<T: Comparable>: BinaryTree<T> {
    // MARK: 添加
    func add(_ element: T) {
        if root == nil { // 添加的第一个元素（根结点）
            root = createNode(element: element)
            size = 1
            afterAdd(root!)
            return
        }
        var node = root
        var parent = root
        var cmp = 0
        while node != nil {
            parent = node
            if element < node!.element {
                node = node!.left
                cmp = -1
            } else if element > node!.element {
                node = node!.right
                cmp = 1
            } else {
                node!.element = element
                cmp = 0
                return
            }
        }
        
        let newNode = createNode(element: element, parent: parent)
        if cmp > 0 {
            parent!.right = newNode
        } else {
            parent!.left = newNode
        }
        size += 1
        afterAdd(newNode)
    }
    
    // MARK: 添加之后调整平衡
    func afterAdd(_ node: Node<T>) {
        
    }
    
    // MARK: 删除之后调整平衡
    func afterRemove(_ node: Node<T>, _ replacement: Node<T>? = nil) {
        
    }
    
    // MARK: 给定结点是否是该二叉树的结点
    func contains(_ element: T) -> Bool {
        return node(element) != nil
    }
    
    // MARK: 删除
    func remove(_ element: T) {
        remove(node: node(element))
    }
    
    private func remove(node: Node<T>?) {
        guard var node = node else { return }
        size -= 1
        if node.hasTwoChildren() {
            // 度为2的结点 找到前驱或者后继结点，覆盖原结点的值，再删除前驱或者后继结点
            // 如果一个结点的度为2，那么它的前驱或者后继结点的度为0或1
            
            // 找到后继节点
            let next = successor(node)
            // 用后继节点的值覆盖度为2的节点的值
            node.element = next!.element
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
    }
    
    // MARK: 根据结点元素查找结点
    private func node(_ element: T) -> Node<T>? {
        var node = root
        while node != nil {
            if node!.element == element {
                return node
            } else if node!.element > element {
                node = node!.left
            } else {
                node = node!.right
            }
        }
        return nil
    }
}
