//: [Previous](@previous)

import Foundation

//在OC中，程序入口是main函数，如下

/*
int main(int argc, char * argv[])
{
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
*/

//上面这段代码调用了UIApplicationMain方法，并传入了四个参数，其中nil意味着默认使用UIApplication
//最后指定了一个Appdekegate来做应用的委托，他被用来做didfinishLaunching或者didEnterBackground等生命周期的委托方法。它会一直存在内存中，直到用户或者系统将它终止

//新建一个 Swift 的 iOS app 项目 后，我们会发现所有文件中都没有一个像 Objective-C 时那样的main文件，也不存在main函 数。唯一和main有关系的是在默认的AppDelegate类的声明上方有一个@UIApplicationMain的标 签。

//这个标签做的事情就是将被标注的类作为委托，去创建一个UIApplication并启动整个程序。在编译的时候，编译器将寻找这个标记的类，并自动插入像main函数这样的模板代码。如果把它去掉就会报错，找不到main函数

/*
 在一般情况下，我们并不需要对这个标签做任何修改，但是当我们如果想要使用UIApplication的 子类而不是它本身的话，我们就需要对这部分内容 “做点手脚” 了。
 刚才说到，其实 Swift 的 app 也是需要main函数的，只不过默认情况下是@UIApplicationMain帮 助我们自动生成了而已。和 C 系语言的main.c或者main.m文件一样，Swift 项目也可以有一个 名为main.swift特殊的文件。在这个文件中，我们不需要定义作用域，而可以直接书写代码。这 个文件中的代码将作为main函数来执行。比如我们在删除@UIApplicationMain后，在项目中添加 一个main.swift文件，然后加上相关的代码
 */

