//: [Previous](@previous)

import Foundation


//说的是...和..<范围遍历的操作符，其实主要还是在字符串里面的额应用

//比如当我们需要遍历字符串的时候，判断是否是所有的都是小写字母

let lowStr = "abcdf"

let interval = "a"..."z"

for char in lowStr.characters {
    if interval.contains(String(char)) {
        print("是小写字母")
    }
    else {
        print("不是小写字母")
    }
}

