//: [Previous](@previous)

import Foundation

//在swift中，数组、字典、集合等容器都遵守这个协议

//

/*  这是协议内容
 
 可以理解为一个构造器协议，当我们遵守这个协议的时候，需要关联具体的遵守了IteratorProtocol的类
 
 associatedtype Element要求实现这个协议的类必须定义一个名为Element的别名，这样一定程度上实现了泛型协议
 
public protocol IteratorProtocol {
    associatedtype Element
    public mutating func next() -> Self.Element?
}
 */


// 先定义一个实现了 IteratorProtocol 协议的类型
// IteratorProtocol 需要指定一个 typealias Element
// 以及提供一个返回 Element? 的方法 next()
class ReverseIterator<T>: IteratorProtocol {
    typealias Element = T
    var arr: [Element]
    var currentIdx = 0
    
    init(arr: [Element]) {
        self.arr = arr
        currentIdx = arr.count - 1
    }
    
    func next() -> T? {
        if currentIdx < 0 {
            return nil
        }
        else {
            let element = arr[currentIdx]
            currentIdx -= 1
            return element
        }
    }
}

struct ReverseSequence<T>: Sequence {
    
    /// 遵守Sequence协议要求指定一个遵守IteratorProtocol协议的具体类型
    typealias Iterator = ReverseIterator<T>
    
    var arr: [T]
    
    init(arr: [T]) {
        self.arr = arr
    }
    
    /// 返回一个具体的构造器，决定如何遍历数组
    ///
    func makeIterator() -> ReverseIterator<T> {
        return ReverseIterator(arr: arr)
    }
}

let arr = [1, 2, 3, 4, 5, 6]

//使用forin 是倒叙输出
for item in ReverseSequence(arr: arr) {
    print(item)
}


//-----------------------分隔线----------------------

//定义一个专门遍历某一钟对象的Sequence

struct Book {
    var name: String = ""
    var price: Float = 0.0
    
    init(name: String, price: Float) {
        self.name = name
        self.price = price
    }
}


//创建一个构造器
class BookListIterator: IteratorProtocol {
    
    typealias Element = Book
    
    var bookList: [Element]
    var currentIdx = 0
    
    init(bookList: [Book]) {
        self.bookList = bookList
    }
    
    func next() -> Book? {
        
        
        if currentIdx < bookList.count {
            let element = bookList[currentIdx]
            currentIdx += 1
            return element
        }
        else {
            return nil
        }
        
    }
    
}

class BookSequence: Sequence {
    typealias Iterator = BookListIterator
    
    var bookList: [Book]
    
    init(bookList: [Book]) {
        self.bookList = bookList
    }
    
    func addBook(_ book: Book) {
        bookList.append(book)
    }
    
    func popTopBook() -> Bool {
        if self.bookList.count == 0 {
            return false
        }
        self.bookList.removeLast()
        return true
    }
    
    func makeIterator() -> BookListIterator {
        return BookListIterator(bookList: self.bookList)
    }
}


var bookList = [Book(name: "ppppp", price: 11), Book(name: "aaaaa", price: 21)]

let bookSequence = BookSequence(bookList: bookList)

bookSequence.addBook(Book(name: "wwwwww", price: 11))

bookSequence.addBook(Book(name: "zzzzzz", price: 16))

for item in bookSequence {
    print(item)
}

bookSequence.popTopBook()
bookSequence.popTopBook()

for item in bookSequence {
    print("-----  \(item)")
}

