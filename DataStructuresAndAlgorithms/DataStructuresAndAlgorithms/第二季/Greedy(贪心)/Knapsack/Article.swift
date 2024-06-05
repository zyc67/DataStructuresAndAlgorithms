//
//  Article.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/6/5.
//

import Foundation

class Article: CustomStringConvertible {
    var weight: Int
    var value: Int
    var valueDensity: Double = 0.0
    
    init(_ weight: Int, _ value: Int) {
        self.weight = weight
        self.value = value
        self.valueDensity = Double(value) / Double(weight)
    }
    
    var description: String {
        return "Article [weight=\(weight), value=\(value)]"
    }
}
