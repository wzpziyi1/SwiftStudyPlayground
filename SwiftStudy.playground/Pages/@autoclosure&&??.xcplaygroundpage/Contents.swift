//: [Previous](@previous)

import Foundation

//@autoclosure做的事情就是把一句表达式自动的封装成一个闭包
//使其在语法层面看起来舒服些
//需要注意的是，@autoclosure并不支持带有输入参数的写法

func logIfTrue(_ predicate: () -> Bool) {
    if predicate() {
        print("True")
    }
}

//上面是一般的写法，我们在调用的时候，是这么使用的:

logIfTrue({ 2 > 1 })
logIfTrue{ 4 > 2 }

//如果使用@autoclosure修饰的话：

func logIfTrueOther(_ predicate: @autoclosure () -> Bool) {
    if predicate() {
        print("True")
    }
}

logIfTrueOther(2 > 1)
logIfTrueOther(4 > 2)


//  ?? 操作符   ,如果Optional类型不为nil，就直接返回它的value，否则返回右侧的值

var x: Int?
let y = 20
let z = x ?? y




		