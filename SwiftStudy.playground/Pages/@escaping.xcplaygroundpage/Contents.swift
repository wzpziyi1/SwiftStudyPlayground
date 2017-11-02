//: [Previous](@previous)

import Foundation
import PlaygroundSupport

//让这个playground永远执行下去
PlaygroundPage.current.needsIndefiniteExecution = true
//@escaping 用来表示一个闭包是一个逃逸闭包，也就是不是随着函数调用同步执行，可以被放在一个容器里面在某个时机被执行，或者异步执行

func doWork(block: () -> ()) {  //同步执行闭包
    block()
}


func doWorkAsync(block: @escaping ()->()) {//异步执行闭包

    DispatchQueue.main.async {
        block()
    }
}


//上面的异步执行的代码，block闭包要是不用@escaping修饰，就会报错

//实际上，上面两个闭包的一些行为是有差异的
//对于doWork 参数里面这样没有逃逸行为的闭包，因为闭包的作用域不超过doWork函数作用域的本身，所以我们不需要担心在闭包内持有 self ，造成循环引用的问题。

//而对于doWorkAsync 这样的有逃逸闭包的函数，由于要确保闭包内的成员在doWorkAsync函数作用域之外依然有效（因为很可能在doWorkAsync执行完毕之后才去调用闭包）,如果在闭包内引用了self的成员，就必须显示的写出self，例如：

class Test {
    var foo = "foo"
    
    func method1() {  //方法一是调用doWork，里面是同步执行闭包
        doWork {
            print(foo)
        }
        
        foo = "bar"
    }
    
    func method2() {  //方法二是异步执行闭包，必须显示写出self，负责会报错
        doWorkAsync {
            print(self.foo)
        }
        
        foo = "bar"
    }
    
    func method3() {  //会输出为nil，是因为对象已经被释放了，self已经被置nil
        doWorkAsync {
            [weak self] in
            print(self?.foo)
        }
        foo = "bar"
    }
    
}


Test().method1()
Test().method2()
Test().method3()

//还需要注意的是，在协议里面有方法的闭包用@escaping修饰了，实现该协议方法的时候，闭包也必须用@escaping修饰，负责会报错

