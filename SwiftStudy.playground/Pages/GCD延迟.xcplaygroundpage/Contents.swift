//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) { 
    
    print("2秒后输出")
    
}

//基于上面代码的封装，加上取消代码

public typealias Task = (_ cancel : Bool) -> Void

public func delay(_ time: TimeInterval, task: @escaping ()->()) ->  Task? {
    
    func dispatch_later(block: @escaping ()->()) {
        let t = DispatchTime.now() + time
        DispatchQueue.main.asyncAfter(deadline: t, execute: block)
    }
    
    
    
    var closure: (()->Void)? = task
    var result: Task?
    
    let delayedClosure: Task = {
        cancel in
        if let internalClosure = closure {
            if (cancel == false) {
                DispatchQueue.main.async(execute: internalClosure)
            }
        }
        closure = nil
        result = nil
    }
    
    result = delayedClosure
    
    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(false)
        }
    }
    
    return result;
    
}

func cancel(_ task: Task?) {
    task?(true)
}
