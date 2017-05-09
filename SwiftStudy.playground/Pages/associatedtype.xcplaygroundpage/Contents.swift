//: [Previous](@previous)

import Foundation




protocol Food {}

protocol Animal {
    func eat(_ food: Food)
}

class Meat: Food {}
class Grass: Food {}

//上面定义了Food、Animal协议，并且有两个结构体遵守着Food协议

struct Tiger: Animal {
    //老虎不吃素，所以需要在这里做一些判断
    func eat(_ food: Food) {
        if food is Meat {
            print("eat meat!")
        }
        else {
            fatalError("Tiger can only eat meat!")
        }
    }
    //这里的要做一层转化，并且把结果交给运行时来判断，那么如何通过在编译期就限定老虎不吃素呢？
}

//那么如果这么写，是否可以呢：

/* 编译器报错，因为Meat类型实际上和我们在Animal协议里面声明的food遵守的Food协议并不等价，所以导致报错
struct Tiger1: Animal {
    func eat(_ food: Meat) {
        print("eat meat!")
    }
}
*/

//那么基于上面的解决方案是，可以重新定义一个Animal协议

protocol Animal1 {
    associatedtype F
    func eat(_ food: F)
}

//这样就不会报错了, 使用associatedtype我们就可以在Animal1协议中添加一个限定，让Tiger1来指定食物的具体类型
struct Tiger1: Animal1 {
    typealias T = Meat   //这一句可写、可不写，编译器会自动推断
    func eat(_ food: Meat) {
        print("eat meat!")
    }
}

struct Sheep: Animal1 {
    func eat(_ food: Grass) {
        print("eat grass!")
    }
}
/*
 在Tiger1通过typealias具体指定F为Meat之前，Animal1协议中并不关心F的具体类型， 只需要满足协议的类型中的F和eat参数一致即可。如此一来，我们就可以避免在         Tiger1的eat中进行判定和转换了。不过这里忽视了被吃的必须是Food协议这个前提。associatedtype声明中可以使用冒号来指定类型满足某个协议，另外，在Tiger1中只要实现了正确类型的eat，T的类型就可以被推断出来，所以我们也不需要显式地写明F。
 */

/*不过在添加associatedtype后，Animal1协议就不能被当作独立的类型使用了。试想我们有一个函 数来判断某个动物是否危险:*/
func isDangerous<T: Animal1>(animal: T) -> Bool {
    if animal is Tiger1 {
        return true
    } else {
        return false
    }
}

isDangerous(animal: Tiger1())
isDangerous(animal: Sheep())
