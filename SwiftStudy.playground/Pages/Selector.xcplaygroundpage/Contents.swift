//: [Previous](@previous)

import Foundation

//其实swift中的#selector也是oc动态加载那一套，所以只有在继承自NSObject的类里面才可以使用
//也就是说，当你要一个private函数可以通过selector取到它的SEL,那么就要在前面加@objc修饰

//


class MyObject: NSObject {
    func callMe() {
        //...
    }
    
    func callMeWithParam(obj: AnyObject!) {
        //...
    }
    
    func turn(by angle: Int, speed: Float) {
        //...
    }
    
    func selectors() -> [Selector] {
        let someMethod = #selector(callMe)
        let anotherMethod = #selector(callMeWithParam(obj:))
        let method = #selector(turn(by:speed:))
        
        return [someMethod, anotherMethod, method]
    }
    
    func otherSelectors() -> [Selector] {
        let someMethod = #selector(callMe)
        let anotherMethod = #selector(callMeWithParam)
        let method = #selector(turn)
        
        return [someMethod, anotherMethod, method]
    }
    
    
    func commonFunc() {
        
    }
    
    func commonFunc(input: Int) -> Int {
        return input
    }
    
    func sameNameSelectors() -> [Selector] {
        let method1 = #selector(commonFunc as ()->())
        let method2 = #selector(commonFunc as (Int)->Int)
        return [method1, method2]
    }
}


let selectors = MyObject().selectors()
print(selectors)

let otherSelectors = MyObject().otherSelectors()
print(otherSelectors)

let sameNameSelectors = MyObject().sameNameSelectors()
print(sameNameSelectors)


