//
//  Times.swift
//  swiftProject
//
//  Created by weather on 2023/8/4.
//

import Foundation

struct TimeTool {
    static func checkFuncTime(file: NSString = #file, task: () -> Void) {
        print("----------【file: \(file.lastPathComponent) func: checkFuncTime START】----------")
        let startTime = Int(Date().timeIntervalSince1970)
        task()
        let endTime = Int(Date().timeIntervalSince1970)
        print("----------【file: \(file.lastPathComponent) func: checkFuncTime 耗时 \(endTime - startTime)秒】----------")
        print("----------【file: \(file.lastPathComponent) func: checkFuncTime END】----------")
    }
}
