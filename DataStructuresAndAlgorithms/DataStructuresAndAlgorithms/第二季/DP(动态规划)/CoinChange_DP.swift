//
//  CoinChange_DP.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/6/5.
//

import Foundation

class CoinChange_DP {
    
    func coin5(_ n: Int, _ faces: [Int]) -> Int {
        if n < 1 || faces.count == 0 {
            return -1
        }
        var dp = Array(repeating: 0, count: n + 1)
        for i in 1...n {
            var m = Int.max
            for face in faces {
                if i < face {
                    continue
                }
                let v = dp[i - face]
                if v < 0 || v >= m {
                    continue
                }
                m = v
            }
            if m == Int.max {
                dp[i] = -1
            } else {
                dp[i] = m + 1
            }
            
        }
        return dp[n]
    }
    
    func coin4(_ n: Int) -> Int {
        if n < 1 {
            return -1
        }
        var dp = Array(repeating: 0, count: n + 1)
        // faces[i]是凑够i分时最后那枚硬币的面值
        var faces = Array(repeating: 0, count: dp.count)
        for i in 1...n {
            var m = dp[i - 1]
            faces[i] = 1
            if i >= 5 && dp[i - 5] < m {
                m = dp[i - 5]
                faces[i] = 5
            }
            if i >= 20 && dp[i - 20] < m {
                m = dp[i - 20]
                faces[i] = 20
            }
            if i >= 25 && dp[i - 25] < m {
                m = dp[i - 25]
                faces[i] = 25
            }
            dp[i] = m + 1
            printCoinChange(faces, i)
        }
        return dp[n]
    }
    
    func printCoinChange(_ faces: [Int], _ n: Int) {
        var nn = n
        print("[\(nn)]=")
        while nn > 0 {
            print(faces[nn])
            nn -= faces[nn]
        }
        print("----------------")
    }
    
    //递推（自底向上）
    func coin3(_ n: Int) -> Int {
        if n < 1 {
            return -1
        }
        var dp = Array(repeating: 0, count: n + 1)
        for i in 1...n {
            var m = dp[i - 1]
            if i >= 5 {
                m = min(dp[i - 5], m)
            }
            if i >= 20 {
                m = min(dp[i - 20], m)
            }
            if i >= 25 {
                m = min(dp[i - 25], m)
            }
            dp[i] = m + 1
        }
        return dp[n]
    }
    
    //记忆化搜索（自顶向下的调用）
    func coin2(_ n: Int) -> Int {
        if n < 1 {
            return -1
        }
        var dp = Array(repeating: 0, count: n + 1)
        let faces = [1, 5, 20, 25]
        for face in faces {
            if face > n {
                break
            }
            dp[face] = 1
        }
        return coin2(n, dp)
    }
    
    func coin2(_ n: Int, _ dp: [Int]) -> Int {
        if n < 1 {
            return Int.max
        }
        var tempDp = dp
        if tempDp[n] == 0 {
            tempDp[n] = min(coin2(n - 25, tempDp), coin2(n - 20, tempDp), coin2(n - 5, tempDp), coin2(n - 1, tempDp)) + 1
        }
        return tempDp[n]
    }
    
    
    //暴力递归（自顶向下的调用，出现了重叠子问题）
    func coin1(_ n: Int) -> Int {
        if n < 1 {
            return Int.max
        }
        if n == 25 || n == 20 || n == 5 || n == 1 {
            return 1
        }
        return min(coin1(n - 25), coin1(n - 20), coin1(n - 5), coin1(n - 1)) + 1
    }
}
