//
//  AVLTree.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2023/10/8.
//

import Foundation

class AVLTree<T: Comparable>: BBST<T> {
    override func afterAdd(_ node: BST<T>.Node<T>) {
        var n = node.parent
        while n != nil {
            if isBalanced(n!) {
                // 更新高度
                updateHeight(n!)
            } else {
                // 恢复平衡
                rebalance(n!)
                break
            }
            n = n!.parent
        }
    }
    
    override func afterRemove(_ node: BinaryTree<T>.Node<T>, _ replacement: BinaryTree<T>.Node<T>? = nil) {
        var n = node.parent
        while n != nil {
            if isBalanced(n!) {
                // 更新高度
                updateHeight(n!)
            } else {
                // 恢复平衡
                rebalance(n!)
            }
            n = n!.parent
        }
    }
    
    //MARK: 结点是否平衡
    private func isBalanced(_ node: Node<T>) -> Bool {
        return abs((node as! AVLNode).balanceFactor()) <= 1
    }
    
    //MARK: 更新高度
    private func updateHeight(_ node: Node<T>) {
        (node as! AVLNode).updateHeight()
    }
    
    //MARK: 恢复平衡
    //MARK: grand 高度最低的那个不平衡结点
    private func rebalance(_ grand: Node<T>) {
        let parent = (grand as! AVLNode).tallerChild() as! AVLNode
        let node = parent.tallerChild() as! AVLNode
        if parent.isLeftChild() { // L
            if node.isLeftChild() { // LL
                rotateRight(grand)
            } else { // LR
                rotateLeft(parent)
                rotateRight(grand)
            }
        } else { // R
            if node.isLeftChild() { // RL
                rotateRight(parent)
                rotateLeft(grand)
            } else { // RR
                rotateLeft(grand)
            }
        }
    }
    
    override func afterRotate(grand: BinaryTree<T>.Node<T>, parent: BinaryTree<T>.Node<T>, child: BinaryTree<T>.Node<T>?) {
        super.afterRotate(grand: grand, parent: parent, child: child)
        // 更新高度
        updateHeight(grand);
        updateHeight(parent);
    }
    
    override func createNode(element: T, parent: BinaryTree<T>.Node<T>? = nil) -> BinaryTree<T>.Node<T> {
        return AVLNode(element: element, parent: parent)
    }
    
    private class AVLNode: Node<T> {
        var height = 1
        
        // 平衡因子
        func balanceFactor() -> Int {
            let leftHeight = self.left == nil ? 0 : (self.left as! AVLNode).height
            let rightHeight = self.right == nil ? 0 : (self.right as! AVLNode).height
            return leftHeight - rightHeight
        }
        
        // 更新高度
        func updateHeight() {
            let leftHeight = self.left == nil ? 0 : (self.left as! AVLNode).height
            let rightHeight = self.right == nil ? 0 : (self.right as! AVLNode).height
            height = 1 + max(leftHeight, rightHeight)
        }
        
        // 高度更高的子结点
        func tallerChild() -> Node<T>? {
            let leftHeight = self.left == nil ? 0 : (self.left as! AVLNode).height
            let rightHeight = self.right == nil ? 0 : (self.right as! AVLNode).height
            if leftHeight > rightHeight {
                return self.left
            }
            if leftHeight < rightHeight {
                return self.right
            }
            return isLeftChild() ? self.left : self.right
        }
    }
}
