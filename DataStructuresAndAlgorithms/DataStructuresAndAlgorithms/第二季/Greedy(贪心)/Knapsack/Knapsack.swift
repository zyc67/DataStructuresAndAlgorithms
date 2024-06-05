//
//  Knapsack.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/6/5.
//

import Foundation

class Knapsack {
    func select(_ title: String, _ cmp: (_ a: Article, _ b: Article) -> Bool) {
        var articles: [Article] = [
            Article(35, 10), Article(30, 40),
            Article(60, 30), Article(50, 50),
            Article(40, 35), Article(10, 40),
            Article(25, 30)
        ]
        articles.sort(by: cmp)
        
        var capacity = 150
        var weight = 0
        var value = 0
        var selectedArticles: [Article] = []
        
        for article in articles {
            if weight >= capacity {
                break
            }
            let newWeight = weight + article.weight
            if newWeight <= capacity {
                weight += article.weight
                value += article.value
                selectedArticles.append(article)
            }
        }
        print("-------------------\(title)-------------------")
        print("总价值:\(value)")
        for article in selectedArticles {
            print(article)
        }
    }
}
