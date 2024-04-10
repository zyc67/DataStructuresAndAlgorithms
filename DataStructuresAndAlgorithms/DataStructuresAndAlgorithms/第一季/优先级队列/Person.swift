//
//  Person.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/1/31.
//

import Foundation

class Person: Comparable, CustomStringConvertible {
    var name: String
    var boneBreak: Int
    var age: Int
    
    init(name: String, boneBreak: Int = 0, age: Int) {
        self.name = name
        self.boneBreak = boneBreak
        self.age = age
    }
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.boneBreak > rhs.boneBreak
    }
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.boneBreak == rhs.boneBreak
    }
    
    var description: String {
        return name + ": \(age)"
    }
}
