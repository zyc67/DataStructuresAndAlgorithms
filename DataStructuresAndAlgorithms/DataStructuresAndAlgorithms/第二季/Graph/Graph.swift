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
    
    func addVertex(_ v: V) {}
    func addEdge(_ from: V, _ to: V) {}
    func addEdge(_ from: V, _ to: V, _ weight: E?) {}
    
    func removeVertex(_ v: V) {}
    func removeEdge(_ from: V, _ to: V) {}
    
    func bfs(_ begin: V) {}
    func dfs(_ begin: V) {}
}
