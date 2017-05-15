//: [Previous](@previous)

import Foundation

//在swift中，能够表示"任意"这个概念除了Any和AnyObject以外，还有AnyClass
//AnyClass在Swift中被一个typealias所定义

typealias AnyClass = AnyObject.Type

//我们可以通过AnyObject.Type这种方式得到一个元类型(Meta)。
//在声明时我们总是在类型的名称后面 加上.Type，比如A.Type代表的是 A 这个类型的类型。也就是说，我们可以声明一个元类型来 存储 A 这个类型本身，而在从A中取出其类型时，我们需要使用到A.self:

class A {
    class func method() {
        print("hello")
    }
}

let typeA: A.Type = A.self

//其实在 Swift 中，.self可以用在类型后面取得类型本身，也可以用在某个实例后面取得 这个实例本身。前一种方法可以用来获得一个表示该类型的值，这在某些时候会很有用; 而后者因为拿到的实例本身，所以暂时似乎没有太多需要这么使用的案例。

//了解了这个基础之后，我们就明白AnyObject.Type，或者说AnyClass所表达的东西其实并没有什 么奇怪，就是任意类型本身。所以，上面对于A的类型的取值，我们也可以强制让它是一个AnyClass

let typeA_any: AnyClass = A.self

(typeA_any as! A.Type).method()


//使用元类型解决某些问题，使得代码更加灵活多变
import UIKit
class MusicViewController: UIViewController {
    
}

class AlbumViewController: UIViewController {
    
}

let usingVCTypes: [AnyClass] = [MusicViewController.self,
                                AlbumViewController.self]

func setupViewControllers(_ vcTypes: [AnyClass]) {
    for vcType in vcTypes {
        if vcType is UIViewController.Type {
            let vc = (vcType as! UIViewController.Type).init()
            print(vc)
        }
        
    }
}

setupViewControllers(usingVCTypes)

