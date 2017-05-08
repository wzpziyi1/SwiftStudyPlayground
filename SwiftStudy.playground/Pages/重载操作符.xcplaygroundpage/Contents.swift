//: [Previous](@previous)

import Foundation

//swift是支持重载操作符的


//表示二维向量
struct Vector2D {
    var x = 0.0
    var y = 0.0
    
}

//求两个Vector2D 相加

let v1 = Vector2D(x: 3.0, y: 4.0)
let v2 = Vector2D(x: 2.0, y: 3.0)
let v3 = Vector2D(x: v1.x + v2.x, y: v1.y + v2.y)
print(v3)


//自定义（已经存在的）加号操作符

func +(left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

let v4 = v1 + v2
print(v4)


//上面是自定义已经存在的操作符，下面试完全自定义操作符，不存在的操作符

//新的云算法，需要使用operator关键字在全局作用域内进行定义，同事还要指定prefix、infix、或者postfix修饰符

func +*(left: Vector2D, right: Vector2D) ->Double {
    return left.x * right.x + left.y * right.y
}

precedencegroup DotProductPrecedence {
    associativity: none
    higherThan: MultiplicationPrecedence
}

infix operator +*: DotProductPrecedence

let p = v1 +* v2



/*
 precedencegroup定义了一个操作符优先级别。操作符优先级的定义和类型声明有些相似，一个操作符比需 要属于某个特定的优先级。Swift 标准库中已经定义了一些常用的运算优先级组，比如加法 优先级 (additionPrecedence) 和乘法优先级 (multiplicationPrecedence) 等，你可以在这里找 到完整的列表。如果没有适合你的运算符的优先级组，你就需要像我们在例子中做得这 样，自己指定结合律方式和优先级顺序了。
 
 
 associativity定义了结合律，即如果多个同类的操作符顺序出现的计算顺序。比如常见的加法和减法都 是left，就是说多个加法同时出现时按照从左往右的顺序计算 (因为加法满足交换律，所 以这个顺序无所谓，但是减法的话计算顺序就很重要了)。点乘的结果是一个double，不 再会和其他点乘结合使用，所以这里是none;
 
 higherThan运算的优先级，点积运算是优先于乘法运算的。除了higherThan，也支持使用lowerTher来指定优先级低于某个其他组。
 
 infix表示要定义的是一个中位操作符，即前后都是输入;其他的修饰子还包括prefix和postfix
 */

