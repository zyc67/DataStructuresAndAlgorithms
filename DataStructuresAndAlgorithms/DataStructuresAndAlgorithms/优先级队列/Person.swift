//
//  Person.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/1/31.
//

import Foundation

class Person: Comparable {
    var name: String
    var boneBreak: Int
    
    init(name: String, boneBreak: Int) {
        self.name = name
        self.boneBreak = boneBreak
    }
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.boneBreak > rhs.boneBreak
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.boneBreak == rhs.boneBreak
    }
}
