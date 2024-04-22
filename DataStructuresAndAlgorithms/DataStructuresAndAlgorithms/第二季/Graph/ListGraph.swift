//
//  ListGraph.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/4/19.
//

import Foundation

class ListGraph<VB : Hashable, EB> : Graph<VB, EB> {
    
    private class Vertex<V : Hashable, E> : Hashable, CustomStringConvertible {
        
        var value: V
        var inEdges: Set<Edge<V, E>> = Set()
        var outEdges: Set<Edge<V, E>> = Set()
        
        init(value: V) {
            self.value = value
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(value)
        }
        
        static func == (lhs: Vertex<V, E>, rhs: Vertex<V, E>) -> Bool {
            return lhs.value == rhs.value
        }
        
        var description: String {
            return value as! String
        }
    }
    
    private class Edge<V : Hashable, E> : Hashable, CustomStringConvertible {
        
        var from: Vertex<V, E>
        var to: Vertex<V, E>
        var weight: E?
        
        init(from: Vertex<V, E>, to: Vertex<V, E>) {
            self.from = from
            self.to = to
        }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(from)
            hasher.combine(to)
        }
        
        static func == (lhs: Edge<V, E>, rhs: Edge<V, E>) -> Bool {
            return lhs.from == rhs.from && lhs.to == rhs.to
        }
        
        var description: String {
            return "Edge [from= \(from), to= \(to), weight=\(String(describing: weight))]"
        }
    }
    
    
    private var vertices: [VB : Vertex<VB, EB>] = [:]
    private var edges: Set<Edge<VB, EB>> = Set()
    
    
    override func edgesSize() -> Int {
        return edges.count
    }
    
    override func verticesSize() -> Int {
        return vertices.count
    }
    
    override func addVertex(_ v: VB) {
        if vertices.keys.contains(v) { return }
        vertices.updateValue(Vertex(value: v), forKey: v)
    }
    
    override func addEdge(_ from: VB, _ to: VB) {
        addEdge(from, to, nil)
    }
    
    override func addEdge(_ from: VB, _ to: VB, _ weight: EB?) {
        var fromVertex = vertices[from]
        if fromVertex == nil {
            fromVertex = Vertex(value: from)
            vertices.updateValue(fromVertex!, forKey: from)
        }
        
        var toVertex = vertices[to]
        if toVertex == nil {
            toVertex = Vertex(value: to)
            vertices.updateValue(toVertex!, forKey: to)
        }
        
        let edge = Edge(from: fromVertex!, to: toVertex!)
        edge.weight = weight
        
        if fromVertex!.outEdges.remove(edge) != nil {
            toVertex!.inEdges.remove(edge)
            edges.remove(edge)
        }
        fromVertex!.outEdges.insert(edge)
        toVertex!.inEdges.insert(edge)
        edges.insert(edge)
    }
    
    override func removeVertex(_ v: VB) {
        guard let vertex = vertices.removeValue(forKey: v) else {
            return
        }
        
        
        var outIterator = vertex.outEdges.makeIterator()
        while let edge = outIterator.next() {
            edge.to.inEdges.remove(edge)
            // 将当前遍历到的元素edge从集合vertex.outEdges中删掉
            vertex.outEdges.remove(edge)
            edges.remove(edge)
        }
        
        var inIterator = vertex.inEdges.makeIterator()
        while let edge = inIterator.next() {
            edge.from.outEdges.remove(edge)
            // 将当前遍历到的元素edge从集合vertex.inEdges中删掉
            vertex.inEdges.remove(edge)
            edges.remove(edge)
        }
    }
    
    override func removeEdge(_ from: VB, _ to: VB) {
        let fromVertex = vertices[from]
        guard let fromVertex = fromVertex else {
            return
        }
        
        let toVertex = vertices[to]
        guard let toVertex = toVertex else {
            return
        }
        let edge = Edge(from: fromVertex, to: toVertex)
        if fromVertex.outEdges.remove(edge) != nil {
            toVertex.inEdges.remove(edge)
            edges.remove(edge)
        }
    }
    
    override func bfs(_ begin: VB, _ visitor: (VB) -> Bool) {
        let beginVertex = vertices[begin]
        guard let beginVertex = beginVertex else {
            return
        }
        var visitedVertices = Set<Vertex<VB, EB>>()
        let queue = Queue<Vertex<VB, EB>>()
        queue.enQueue(beginVertex)
        visitedVertices.insert(beginVertex)
        while !queue.isEmpty() {
            let vertex = queue.deQueue()
            if visitor(vertex!.value) {
                return
            }
            for edge in vertex!.outEdges {
                if visitedVertices.contains(edge.to) {
                    continue
                }
                queue.enQueue(edge.to)
                visitedVertices.insert(edge.to)
            }
        }
    }
    
    override func dfs(_ begin: VB, _ visitor: (VB) -> Bool) {
        let beginVertex = vertices[begin]
        guard let beginVertex = beginVertex else {
            return
        }
        var visitedVertices = Set<Vertex<VB, EB>>()
        let stack = Stack<Vertex<VB, EB>>()
        stack.push(beginVertex)
        visitedVertices.insert(beginVertex)
        if visitor(begin) {
            return
        }
        
        while !stack.isEmpty() {
            let vertex = stack.pop()
            for edge in vertex!.outEdges {
                if visitedVertices.contains(edge.to) {
                    continue
                }
                stack.push(edge.from)
                stack.push(edge.to)
                visitedVertices.insert(edge.to)
                if visitor(edge.to.value) {
                    return
                }
                break
            }
        }
    }
    
    // 拓扑排序
    // ① 把所有入度为 0 的顶点放入 L 中，然后把这些顶点从图中去掉
    // ② 重复操作 ①，直到找不到入度为 0 的顶点
    override func topologicalSort() -> Array<VB> {
        var list = Array<VB>()
        let queue = Queue<Vertex<VB, EB>>()
        var ins: [Vertex<VB, EB> : Int] = [:]
        // 初始化（将度为0的节点都放入队列）
        for (_, vertex) in vertices {
            let inSize = vertex.inEdges.count
            if inSize == 0 {
                queue.enQueue(vertex)
            } else {
                ins.updateValue(inSize, forKey: vertex)
            }
        }
        while !queue.isEmpty() {
            let vertex = queue.deQueue()
            list.append(vertex!.value)
            for edge in vertex!.outEdges {
                let toSize = ins[edge.to]! - 1
                if toSize == 0 {
                    queue.enQueue(edge.to)
                } else {
                    ins.updateValue(toSize, forKey: edge.to)
                }
            }
        }
        return list
    }
    
//    override func topologicalSort() -> Array<VB> {
//        var list = Array<VB>()
//        var array = Array<Vertex<VB, EB>>()
//        var ins: [Vertex<VB, EB> : Int] = [:]
//        // 初始化（将度为0的节点都放入队列）
//        for (_, vertex) in vertices {
//            let inSize = vertex.inEdges.count
//            if inSize == 0 {
//                array.append(vertex)
//            } else {
//                ins.updateValue(inSize, forKey: vertex)
//            }
//        }
//        while !array.isEmpty {
//            let vertex = array.removeFirst()
//            list.append(vertex.value)
//            for edge in vertex.outEdges {
//                let toSize = ins[edge.to]! - 1
//                if toSize == 0 {
//                    array.append(edge.to)
//                } else {
//                    ins.updateValue(toSize, forKey: edge.to)
//                }
//            }
//        }
//        return list
//    }
    
    func printGraph() {
        print("[顶点]-------------------")
        vertices.forEach { (v: VB, vertex: Vertex<VB, EB>)  in
            print(v)
            print("out-----------")
            print(vertex.outEdges)
            print("in-----------")
            print(vertex.inEdges)
        }
        
        print("[边]-------------------")
        edges.forEach { edge in
            print(edge)
        }
    }
}
