//: [Previous](@previous)

import Foundation

//使用NSRegularExpression来做正则匹配，可以自定义=~这个运算符

//我们可以先写一个接受正则表达式的 字符串，以此生成NSRegularExpression对象。然后使用该对象来匹配输入字符串，并返回结果告 诉调用者匹配是否成功。一个最简单的实现可能是下面这样的:

struct RegexHelper {
    let regex: NSRegularExpression
    
    init(_ pattern: String) throws {
        try regex = NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    }
    
    func match(_ input: String) -> Bool {
        let matches = regex.matches(in: input, options: [], range: NSMakeRange(0, input.utf16.count))
        return matches.count > 0
    }
    
}

//比如想要匹配一个邮箱地址:

let mailPattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"

let matcher: RegexHelper
do {
    matcher = try RegexHelper(mailPattern)
}

let mayBeMailAddress = "1204473090@qq.com"

if matcher.match(mayBeMailAddress) {
    print("有效的邮箱地址")
}


/*自定义=~操作符
 */

precedencegroup MatchPrecedence {
    associativity: none
    higherThan: DefaultPrecedence
}

infix operator =~: MatchPrecedence

func =~(lhs: String, rhs: String) -> Bool {
    do {
        return try RegexHelper(rhs).match(lhs)
    } catch _ {
        return false
    }
}


if "1204473090@qq.com" =~ "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$" {
    print("=~： 是有效的邮箱地址")
}

