//: [Previous](@previous)

import Foundation

//以前写一个两个元素进行交换，一般这么写：
func swapItem1<T>(_ a: inout T, b: inout T) {
    let c = a
    a = b
    b = c
}

//需要注意的是，这么写需要创建额外的内存空间，使用元组来写的话，就不需要
func swapItem2<T>(_ a: inout T, b: inout T) {
    (a, b) = (b, a)
}


var a = 10, b = 20
swapItem2(&a, b: &b)
print("\(a)  \(b)")


		