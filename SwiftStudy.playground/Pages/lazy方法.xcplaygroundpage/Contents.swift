//: [Previous](@previous)

import Foundation

//lazy这些方法可以配合像map或是filter这类接受闭包并进行运行的方法一起，让整个行为变成延 时进行的。在某些情况下这么做也对性能会有不小的帮助。

let data2 = 1...3
let result2 = data2.lazy.map {
    (i: Int) -> Int in
    print("正在处理 \(i)")
    return i * 2
}

print("准备访问结果")
for i in result2 {
    print("操作后结果为 \(i)")
}

print("操作完毕")

//对于那些不需要完全运行，可能提前退出的情况，使用lazy来进行性能优化效果会非常有效。