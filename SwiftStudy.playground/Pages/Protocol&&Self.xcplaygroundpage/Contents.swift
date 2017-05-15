//: [Previous](@previous)

import Foundation

//首字母大写的Self
//这么定义是因为协议其实本身是没有自己的上下文类型信息的，在声明协议的时候，我们并不知 道最后究竟会是什么样的类型来实现这个协议，Swift 中也不能在协议中定义泛型进行限制。而在 声明协议时，我们希望在协议中使用的类型就是实现这个协议本身的类型的话，就需要使用Self进行指代。
//但是在这种情况下，Self不仅指代的是实现该协议的类型本身，也包括了这个类型的子类。从概 念上来说，Self十分简单，但是实际实现一个这样的方法却稍微要转个弯。为了说明这个问题， 我们假设要实现一个Copyable的协议，满足这个协议的类型需要返回一个和接受方法调用的实例 相同的拷贝。一开始我们可能考虑的协议是这样的:

protocol Copyable {
    func copy() -> Self
}

//这是很直接明了的，它应该做的是创建一个和接受这个方法的对象同样的东西，然后将其返回， 返回的类型不应该发生改变，所以写为Self。然后开始尝试实现一个MyClass来满足这个协议:
class MyClass: Copyable {
    
    var num = 1
    
    //需要注意的是，MyClass里面copy方法的实现，有时候我们会写成下面这种错误的形式:
    
//    func copy() -> Self {
//        let result = MyClass()
//        result.num = num
//        return result
//    }
    
    //上面的那个方法有问题，显然类型是有问题的，因为该方法要求返回一个抽象的、表示当前类型的Self，但是我们却 返回了它的真实类型MyClass，这导致了无法编译。也许你会尝试把方法声明中的Self改为MyClass，这样声明就和实际返回一致了，但是很快你会发现这样的话，实现的方法又和协议中的 定义不一样了，依然不能编译。
    
    //为了解决这个问题，我们在这里需要的是通过一个和当前上下文 (也就是和MyClass) 无关的，又能够指代当前类型的方式进行初始化。希望你还能记得我们在对象类型中所提到的type(of:)，这 里我们就可以使用它来做初始化，以保证方法与当前类型上下文无关，这样不论是MyClass还是 它的子类，都可以正确地返回合适的类型满足Self的要求：
    
    func copy() -> Self {
        let result = type(of: self).init()
        result.num = num
        return result
    }
    
    
    //但是，单单是这样还是无法通过编译，编译器提示我们如果想要构建一个Self类型的对 象的话，需要有required关键字修饰的初始化方法，这是因为 Swift 必须保证当前类和其子类都 能响应这个init方法。另一个解决的方案是在当前类类的声明前添加final关键字，告诉编译 器我们不再会有子类来继承这个类型。在这个例子中，我们选择添加上required的init方法
    required init() {
        
    }
}

let object = MyClass()
object.num = 100

let newObject = object.copy()
object.num = 1

print(object.num)
print(newObject.num)


//另一个可以使用Self的地方是在类方法中，使用起来也十分相似，核心就在于保证子类也能返 回恰当的类型。



