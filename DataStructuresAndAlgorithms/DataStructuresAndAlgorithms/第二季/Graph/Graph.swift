//
//  Graph.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/4/19.
//

import Foundation

class Graph<V, E> {
    
    func edgesSize() -> Int {
        return 0
    }
    func verticesSize() -> Int {
        return 0
    }
    
    // MARK: 添加顶点
    func addVertex(_ v: V) {}
    // MARK: 添加边
    func addEdge(_ from: V, _ to: V) {}
    func addEdge(_ from: V, _ to: V, _ weight: E?) {}
    
    // MARK: 移除顶点
    func removeVertex(_ v: V) {}
    // MARK: 移除边
    func removeEdge(_ from: V, _ to: V) {}
    
    // MARK: 广度优先搜索
    func bfs(_ begin: V, _ visitor: (V) -> Bool) {}
    // MARK: 深度优先搜索
    func dfs(_ begin: V, _ visitor: (V) -> Bool) {}
    
    
}

