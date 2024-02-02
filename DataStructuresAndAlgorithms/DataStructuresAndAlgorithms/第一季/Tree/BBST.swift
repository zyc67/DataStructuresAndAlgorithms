//
//  BBST.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/1/11.
//

import Foundation

class BBST<T: Comparable>: BST<T> {
    
    func rotateLeft(_ grand: Node<T>) {
        let parent = grand.right!
        let child = parent.left
        grand.right = child
        parent.left = grand
        afterRotate(grand: grand, parent: parent, child: child)
    }
    
    func rotateRight(_ grand: Node<T>) {
        let parent = grand.left!
        let child = parent.right
        grand.left = child
        parent.right = grand
        afterRotate(grand: grand, parent: parent, child: child)
    }
    
    func afterRotate(grand: Node<T>, parent: Node<T>, child: Node<T>?) {
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
    
}
