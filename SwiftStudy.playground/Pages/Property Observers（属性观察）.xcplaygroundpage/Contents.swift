//: [Previous](@previous)

import Foundation

//Swift中提供了两个属性观察的方法，willSet和didSet

class MyClass {
    
    let oneYearInSecond: TimeInterval = 365 * 24 * 60 * 60
    
    var date: NSDate {
        willSet {
            let d = date
            print("即将将日期从 \(d) 设定至 \(newValue)")
        }
        
        didSet {
            if (date.timeIntervalSinceNow > oneYearInSecond) {
                print("设定的时间太晚了！")
                date = NSDate().addingTimeInterval(oneYearInSecond)
            }
            print("已经将日期从 \(oldValue) 设定至 \(date)")
        }
    }
    
    init() {
        date = NSDate()
    }
}

let foo = MyClass()
foo.date = foo.date.addingTimeInterval(10086)


foo.date = foo.date.addingTimeInterval(100_000_000)

/*
 在 Swift 中所声明的属性包括存储属性和计算属性两种。其中存储属性将会在内存中实 际分配地址对属性进行存储，而计算属性则不包括背后的存储，只是提供get和set两种方 法。在同一个类型中，属性观察和计算属性是不能同时共存的。也就是说，想在一个属性定义中 同时出现set和willSet或didSet是一件办不到的事情。计算属性中我们可以通过改写set中的内容来达到和willSet及didSet同样的属性观察的目的。如果我们无法改动这个类，又想 要通过属性观察做一些事情的话，可能就需要子类化这个类，并且重写它的属性了。重写的属性 并不知道父类属性的具体实现情况，而只从父类属性中继承名字和类型，因此在子类的重载属性 中我们是可以对父类的属性任意地添加属性观察的，而不用在意父类中到底是存储属性还是计算 属性
 */

class A {
    var number :Int {
        get {
            print("get")
            return 1
        }
        
        set {print("set")}
    }
}

class B: A {
    override var number: Int {
        willSet {print("willSet")}
        didSet {print("didSet")}
    }
}

let b = B()
b.number = 0
