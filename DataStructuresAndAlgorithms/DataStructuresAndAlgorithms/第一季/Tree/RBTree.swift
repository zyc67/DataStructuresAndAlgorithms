//
//  RBTree.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/1/10.
//

import Foundation

class RBTree<T: Comparable>: BBST<T> {
    enum RBColor {
        case RED
        case BLACK
    }
    
    override func afterAdd(_ node: BinaryTree<T>.Node<T>) {
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
            afterAdd(grand!)
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
    
    override func afterRemove(_ node: BinaryTree<T>.Node<T>, _ replacement: BinaryTree<T>.Node<T>? = nil) {
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
    
    override func createNode(element: T, parent: BinaryTree<T>.Node<T>? = nil) -> BinaryTree<T>.Node<T> {
        return RBNode(element: element, parent: parent)
    }
    
    // MARK: 染色
    private func renderColor(_ color: RBColor, node: Node<T>?) -> Node<T>? {
        guard let node = node else {
            return node
        }
        (node as! RBNode).color = color
        return node
    }
    
    private func red(node: Node<T>?) -> Node<T>? {
        return renderColor(RBColor.RED, node: node)
    }
    
    private func black(node: Node<T>?) -> Node<T>? {
        return renderColor(RBColor.BLACK, node: node)
    }
    
    private func colorOf(node: Node<T>?) -> RBColor {
        return node == nil ? RBColor.BLACK : (node as! RBNode).color
    }
    
    private func isBlack(node: Node<T>?) -> Bool {
        return colorOf(node: node) == RBColor.BLACK
    }
    
    private func isRed(node: Node<T>?) -> Bool {
        return colorOf(node: node) == RBColor.RED
    }
    
    class RBNode: Node<T> {
        var color: RBColor = .RED
    }
    
    //中序: 左 根 右
    override func toString(_ node: Node<T>?, preifx: String) {
        if node == nil { return }
        toString(node?.left, preifx: preifx + "L---")
        if (node as! RBNode).color == RBColor.RED {
            print("\(preifx)\(node!.element)(R)")
        } else {
            print("\(preifx)\(node!.element)")
        }
        toString(node?.right, preifx: preifx + "R---")
    }
}
