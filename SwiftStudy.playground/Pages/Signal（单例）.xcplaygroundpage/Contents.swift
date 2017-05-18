//: [Previous](@previous)

import Foundation

//swift中与OC中的单利是不同的，swift中的很简洁

class ZYManager {
    static let shared = ZYManager()
    private init() {}
}