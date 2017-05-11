//: [Previous](@previous)

import Foundation

//可变参数列表只的是可以接收任意多个参数的函数，比如OC中的[NSString stringWithFormat:]

//例如下面的函数，就是一个接收可变参数的sum

func sum(input: Int...) -> Int {
    return input.reduce(0, +)
}

print(sum(input: 1,2,3,4,5))

//在Swift中,可变参数可以放到参数列表的任意位置，但是一个函数只能有一个可变参数，并且这个可变参数的所有值是同一种类型等。

//在Swift中可以使用_来隐藏参数，那么可以做到很高的灵活性，比如OC中的[NSString stringWithFormat:]方法在Swift中是这么实现的：

//extension String {
//    convenience init(format: String, _ args: CVarArg...) {
//        
//    }
//}

let name = "Tom"
let date = NSDate()
let string = NSString(format: "Hello %@. Date: %@", name, date)
