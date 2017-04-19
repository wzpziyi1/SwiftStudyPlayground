//: Playground - noun: a place where people can play

//实际就是在一个函数里面返回一个闭包p，这个闭包捕获了在调用函数时传入的某个值a，然后再调用闭包p，传入一个值b，然后闭包就会去比较值a与值b

import UIKit


//简单的加法函数
func addOne(num: Int) -> Int {
    return num + 1
}

addOne(num: 2)

//Curring的优势在于，可以定义一个通用的方法，例如：

func addTo(_ adder: Int) -> (Int) -> Int {
    return {
        num in
        return num + adder
    }
}

//返回的是一个闭包，可以用这个闭包再去搞事情
let addFive = addTo(5)
let result = addFive(6)


//例如一个比较大小的函数
func greaterThan(_ comparer: Int) -> (Int) -> Bool {
    return { $0 > comparer }
}

let greaterThan10 = greaterThan(10)

let rusult1 = greaterThan10(11)
let result2 = greaterThan10(9)



//--------------------暂时没看懂下面的实现--------------------


protocol TargetAction {
    func performAction()
}

struct TargetActionWrapper<T: AnyObject>: TargetAction {
    weak var target: T?
    let action: (T) -> () -> ()
    
    func performAction() -> () {
        if let t = target {
            action(t)()
        }
    }
}

enum ControlEvent {
    case TouchUpInside
    case ValueChanged
    // ...
}


class Control {
    var actions = [ControlEvent: TargetAction]()
    
    func setTarget<T: AnyObject>(target: T,
                   action: @escaping (T) -> () -> (), controlEvent: ControlEvent) {
        
        actions[controlEvent] = TargetActionWrapper(
            target: target, action: action)
    }
    
    func removeTargetForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent] = nil
    }
    
    func performActionForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent]?.performAction()
    }
}

//使用
//class MyViewController {
//    let button = Control()
//
//    func viewDidLoad() {
//        button.setTarget(self, action: MyViewController.onButtonTap, controlEvent: .TouchUpInside)
//    }
//
//    func onButtonTap() {
//        println("Button was tapped")
//    }
//}




