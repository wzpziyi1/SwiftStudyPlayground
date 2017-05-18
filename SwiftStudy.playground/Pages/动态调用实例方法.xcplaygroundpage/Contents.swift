//: [Previous](@previous)

import Foundation

//有一种用类名来动态调用实例方法的写法：

class MyClass {
    func sum() -> Int {
        return 10
    }
}

//这个时候，method1是(MyClass) -> () -> Int   这种类型，也就是柯里化里面提到的
let method1 = MyClass.sum
//然后初始化一个实例
let object = MyClass()
//调用,相当执行（调用了method1(object)）后返回的闭包,也就是 func sum() -> Int 函数，详细描述可以看柯里化里面的内容
method1(object)()



//如果有个类方法和对象方法同名的情况

class MyClass1 {
    func method(number: Int) -> Int {
        return number + 1
    }
    
    class func method(number: Int) -> Int {
        return number
    }
}

// 类方法的版本
let f1 = MyClass1.method


let f2: (Int) -> Int = MyClass1.method

// f2 的详细柯里化版本
let f3: (MyClass1) -> (Int) -> Int = MyClass1.method



