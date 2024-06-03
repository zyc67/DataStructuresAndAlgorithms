//
//  Pirate.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/6/3.
//

import Foundation

/**
 最优装载问题（加勒比海盗）
 在北美洲东南部，有一片神秘的海域，是海盗最活跃的加勒比海
 有一天，海盗们截获了一艘装满各种各样古董的货船，每一件古董都价值连城，一旦打碎就失去了它的价值
 海盗船的载重量为 W，每件古董的重量为 𝑤i，海盗们该如何把尽可能多数量的古董装上海盗船？
 比如 W 为 30，𝑤i 分别为 3、5、4、10、7、14、2、11
 ◼ 贪心策略：每一次都优先选择重量最小的古董
 ① 选择重量为 2 的古董，剩重量 28
 ② 选择重量为 3 的古董，剩重量 25
 ③ 选择重量为 4 的古董，剩重量 21
 ④ 选择重量为 5 的古董，剩重量 16
 ⑤ 选择重量为 7 的古董，剩重量 9
 最多能装载 5 个古董
 */

class Pirate {
    
    var weights: [Int]
    var capacity: Int
    
    init(weights: [Int], capacity: Int) {
        self.weights = weights
        self.capacity = capacity
    }
    
    func totalNum() {
        var count = 0
        var weight: Int = 0
        // 从小到大排序
//        weights.sort { $0 < $1}
        weights.sort()
        
        for w in weights {
            let newWeight = weight + w
            if (newWeight <= capacity) {
                weight = newWeight
                count += 1
                print(w)
            }
        }
        print("一共选了\(count)件古董")
    }
}
