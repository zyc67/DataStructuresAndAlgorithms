//
//  main.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2023/9/18.
//

import Foundation

var intList = VirtualHeadSingleLinkedList<Int>()
intList.add(11)
intList.add(22)
intList.add(33)
intList.add(44)
intList.set(1, 222)

intList.add(100, 55)
intList.add(2, 66)
intList.add(intList.size, 77)
intList.remove(0)
intList.remove(2)
intList.remove(intList.size - 1)
print(intList.indexOf(66))

class Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        lhs.age == rhs.age
    }
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}


var pList = SingleLinkedList<Person>()
var p1 = Person(name: "a", age: 1)
var p2 = Person(name: "b", age: 2)
var p3 = Person(name: "b", age: 1)
pList.add(p1)
pList.add(p2)
print(pList.indexOf(p3))

