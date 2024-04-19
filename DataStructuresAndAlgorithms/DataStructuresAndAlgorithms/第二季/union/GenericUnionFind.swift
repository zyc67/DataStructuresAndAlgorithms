//
//  GenericUnionFind.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/4/19.
//

import Foundation

class GenericUnionFind<V: Hashable> {
    private var nodes: [V : Node<V>] = [:]
    
    func makeSet(_ v: V) {
        if nodes.keys.contains(v) {
            return
        }
        let node = Node(value: v)
        node.parent = node
        nodes.updateValue(node, forKey: v)
    }
    
    // 找出v的根节点
    private func findNode(_ v: V) -> Node<V>? {
        guard let node = nodes[v] else {
            return nil
        }
        
        var temp = node
        while temp.value != temp.parent!.value {
            temp.parent = temp.parent!.parent
            temp = temp.parent!
        }
        return temp
    }
    
    func find(_ v: V) -> V? {
        let node = findNode(v)
        return node == nil ? nil : node!.value
    }
    
    func union(_ v1: V, _ v2: V) {
        let p1 = findNode(v1)
        let p2 = findNode(v2)
        guard let p1 = p1 else {
            return
        }
        guard let p2 = p2 else {
            return
        }
        if p1.value == p2.value {
            return
        }
        
        if p1.rank < p2.rank {
            p1.parent = p2
        } else if p1.rank > p2.rank {
            p2.parent = p1
        } else {
            p1.parent = p2
            p2.rank += 1
        }
    }
    
    func isSame(_ v1: V, _ v2: V) -> Bool {
        return find(v1) == find(v2)
    }

    private class Node<T: Equatable> {
        var value: T
        var parent: Node<T>?
        var rank = 1
        init(value: T) {
            self.value = value
        }
    }
}
