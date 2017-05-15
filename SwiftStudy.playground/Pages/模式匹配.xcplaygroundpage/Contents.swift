
//: [Previous](@previous)

import Foundation

var str = "Hello, playground"


//func ==<T: Equatable>(a: T, b: T) -> Bool 

//一般来说，要可以判断两个变量想不想等，他们都得遵守Equalable才可以判断

//用switch来判等


//1
let password = "akfuv"
switch password {
    case "akfuv": print("验证成功")
    default:      print("验证失败")
}

//2
let num: Int? = nil
switch num {
case nil: print("没值")
default:  print("\(num!)")
}

//3对范围的判断
let x = 0.5
switch x {
case -1.0...1.0:
    print("区间内")
default:
    print("区间外")
}

//我们可以重载~=操作符，来实现一个模式匹配


func ~=(pattern: NSRegularExpression, input: String) -> Bool {
    return pattern.numberOfMatches(in: input,
                                   options: [],
                                   range: NSRange(location: 0, length: input.characters.count)) > 0
}

prefix operator ~/

prefix func ~/(pattern: String) throws -> NSRegularExpression {
    return try NSRegularExpression(pattern: pattern, options: [])
}

let contact = ("http://onevcat.com", "onev@onevcat.com")

let mailRegex: NSRegularExpression
let siteRegex: NSRegularExpression

mailRegex = try ~/"^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
siteRegex = try ~/"^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$"

switch contact {
case (siteRegex, mailRegex): print("同时拥有有效的网站和邮箱")
case (_, mailRegex): print("只拥有有效的邮箱")
case (siteRegex, _): print("只拥有有效的网站")
default: print("嘛都没有")
}


