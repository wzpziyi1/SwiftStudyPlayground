//: [Previous](@previous)

import Foundation

//Optional chaining没多少可以说的东西，需要注意的是，它是随时可能提前返回nil的，所以在使用Optional chaining的时候，最后得到的东西都是Optional的。

//之前写代码的时候就被这个特性给坑了，在oc项目里面混编swift，然后在swift文件里面拼接oc的模型里的字符串的时候，发现一堆Optional()。

