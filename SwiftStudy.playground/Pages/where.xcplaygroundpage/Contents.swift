//: [Previous](@previous)

import Foundation

//在swift中，我们可以使用where来限定某些条件case

let names = ["张三","张四","李三","李三","王三"]

for name in names {
    switch name {
    case name where name.hasPrefix("王"): print("\(name)是他笔名")
    case name where name.hasPrefix("张"): print("\(name)是他网名")
    default: print("\(name)是无意义的名字")
    }
}

//在for中也可以使用

let numArr: [Int?] = [12, 23, 66, 99, nil]

let n = numArr.flatMap{$0}

for score in n where score >= 60 {
    print("及格了")
}

//关于if中的限定

numArr.forEach {
    if let score = $0, score >= 60 {
        print("及格了")
    } else {
        print(":(")
    }
}

//它还可以用在协议中
extension IteratorProtocol where Self: Sequence {
    
}

//用在函数中
func !=<T: RawRepresentable>(a: T, b: T) -> Bool where T.RawValue: Equatable {
    return a.rawValue != b.rawValue
}





