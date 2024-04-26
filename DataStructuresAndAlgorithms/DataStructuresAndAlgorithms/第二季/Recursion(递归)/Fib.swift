//
//  Fib.swift
//  DataStructuresAndAlgorithms
//
//  Created by weather on 2024/4/26.
//

import Foundation

/*
 斐波那契数列
 f(1) = 1, f(2) = 1
 f(n) = f(n - 1) + f(n - 2) n>= 3
 递归调用的空间复杂度 = 递归深度 * 每次调用所需的辅助空间
 注意：n太大(比如100)导致返回值超过Int最大值越界
 */

class Fib {
    static func fib0(_ n: Int) -> Int {
        if n <= 2 {
            return 1
        }
        return fib0(n - 1) + fib0(n - 2)
    } // 时间复杂度：O(2^n)，空间复杂度：O(n)
    // T(n) = T(n - 1) + T(n − 2) + O(1)
    
    static func fib1(_ n: Int) -> Int {
        if n <= 2 {
            return 1
        }
        var array = Array(repeating: 0, count: n + 1)
        array[1] = 1
        array[2] = 1
        return fib1(n, array)
    } // 时间复杂度：O(n)，空间复杂度：O(n)
    
    static func fib1(_ n: Int, _  array: [Int]) -> Int {
        var arrayM = array;
        if arrayM[n] == 0 {
            arrayM[n] = fib1(n - 1, arrayM) + fib1(n - 2, arrayM)
        }
        return arrayM[n]
    }
    
    static func fib2(_ n: Int) -> Int {
        if n <= 2 {
            return 1
        }
        var array = Array(repeating: 0, count: n + 1)
        array[1] = 1
        array[2] = 1
        for index in 3...n {
            array[index] = array[index - 1] + array[index - 2]
        }
        return array[n]
    } // 时间复杂度：O(n)，空间复杂度：O(n)
    
    //1 -> 1   2   3   4   5   6   7   8   9   10
    //2 -> 1   1   2   3   5   8   13  21  44  65
    //3 -> 1   2
    //4 -> 3   2
    //5 -> 3   5
    //6 -> 8   5
    static func fib3(_ n: Int) -> Int {
        if n <= 2 {
            return 1
        }
        var array: [Int] = []
        array.append(contentsOf: [1, 1])
        for index in 3...n {
            array[index % 2] = array[(index - 1)  % 2] + array[(index - 2) % 2]
        }
        return array[n  % 2]
    } // 时间复杂度：O(n)，空间复杂度：O(1)
    
    static func fib4(_ n: Int) -> Int {
        if n <= 2 {
            return 1
        }
        var array: [Int] = []
        array.append(contentsOf: [1, 1])
        for index in 3...n {
            array[index & 1] = array[(index - 1) & 1] + array[(index - 2) & 1]
        }
        return array[n & 1]
    }// 时间复杂度：O(n)，空间复杂度：O(1)
    // 乘、除、模运算效率较低，建议用其他方式取代
    
    // 3 % 2 = 1 -> 0b0011 & 0b0001 = 1
    // 4 % 2 = 0 -> 0b0100 & 0b0001 = 0
    // 5 % 2 = 1 -> 0b0101 & 0b0001 = 1
    // 6 % 2 = 0 -> 0b0110 & 0b0001 = 0
    // 7 % 2 = 1 -> 0b0111 & 0b0001 = 1
    // 8 % 2 = 0 -> 0b1000 & 0b0001 = 0
    // 9 % 2 = 1 -> 0b1001 & 0b0001 = 1
    //10 % 2 = 0 -> 0b1010 & 0b0001 = 0
    
    //19 % 2 = 1 -> 0b10011 & 0b00001 = 1
    //20 % 2 = 0 -> 0b10100 & 0b00001 = 0
    
    static func fib5(_ n: Int) -> Int {
        if n <= 2 {
            return 1
        }
        var first = 1
        var second = 1
        for _ in 3...n {
            second = first + second
            first = second - first
        }
        return second
    } // 时间复杂度：O(n)，空间复杂度：O(1)
}


//1 -> 1   2   3   4   5   6   7   8   9   10
//2 -> 1   1   2   3   5   8   13  21  34  55
//3 -> 1   2
//4 -> 3   2
//5 -> 3   5
//6 -> 8   5
