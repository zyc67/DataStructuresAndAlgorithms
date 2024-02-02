//
//  Trie.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/2/1.
//

import Foundation

class Trie<T> {
    private var size: Int = 0
    private var root: Node<T>?
    
    func getSize() -> Int {
        size
    }
    
    func isEmpty() -> Bool {
        size == 0
    }
    
    func clear() {
        size = 0
        root = nil
    }
    
    func get(_ key: String) -> T? {
        let node = node(key)
        return node != nil && node!.word ? node!.value : nil
    }
    
    func add(_ key: String, _ value: T) -> T? {
        // 创建根节点
        if root == nil {
            root = Node(parent: nil, word: false)
        }
        var node = root
        for c in key {
            let emptyChildren = node?.children == nil
            var childNode = emptyChildren ? nil : node?.children?[c]
            if childNode == nil {
                childNode = Node(parent: node, word: false)
                childNode?.character = c
                node?.children = emptyChildren ? [Character: Node<T>]() : node?.children
                node?.children?[c] = childNode
            }
            node = childNode
        }
        
        if node!.word { // 已经存在这个单词
            let oldValue = node!.value
            node!.value = value
            return oldValue
        }
        // 新增一个单词
        node!.word = true
        node!.value = value
        size += 1
        return nil
    }
    
    func remove(_ key: String) -> T? {
        // 找到最后一个节点
        var node = node(key)
        // 如果不是单词结尾，不用作任何处理
        if node == nil || !node!.word {
            return nil
        }
        size -= 1
        let oldValue = node!.value
        
        // 如果还有子节点
        if node!.children != nil && !node!.children!.isEmpty {
            node!.word = false
            node!.value = nil
            return oldValue
        }
        // 如果没有子节点
        var parent: Node<T>? = node!.parent
        while parent != nil {
            parent!.children!.removeValue(forKey: node!.character!)
            if parent!.word || !parent!.children!.isEmpty {
                break
            }
            node = parent
            parent = parent!.parent
        }
        return oldValue
    }
    
    func contains(_ key: String) -> Bool {
        let node = node(key)
        return node != nil && node!.word
    }
    
    func startsWith(_ prefix: String) -> Bool {
        return node(prefix) != nil
    }
    
    private func node(_ key: String) -> Node<T>? {
        if key.count == 0 {
            return nil
        }
        var node = root
        for c in key {
            if node == nil || node?.children == nil || node!.children!.isEmpty {
                return nil
            }
            node = node!.children![c]
        }
        return node
    }
    
    private class Node<V> {
        var parent: Node<V>?
        var children: [Character: Node<V>]?
        var character: Character?
        var value: V?
        var word: Bool = false // 是否为单词的结尾（是否为一个完整的单词）
        init(parent: Node<V>? = nil, children: [Character : Node<V>]? = nil, character: Character? = nil, value: V? = nil, word: Bool) {
            self.parent = parent
            self.children = children
            self.character = character
            self.value = value
            self.word = word
        }
    }
}
