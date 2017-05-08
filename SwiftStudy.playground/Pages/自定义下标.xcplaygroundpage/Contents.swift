//: [Previous](@previous)

import Foundation

//swift是支持自定义下标的，比如数组的下标

/*Array，一个是直接取下标，一个是取一个范围内的下标
public subscript(index: Int) -> Element
public subscript(bounds: Range<Int>) -> ArraySlice<Element>
*/

//这里，自定义一个根据传入数组的具体下标，取到一个数组（这里面装具体的值）

extension Array {
    subscript(input: [Int]) -> ArraySlice<Element> {
        get{
            var result = ArraySlice<Element>()
            
            for i in input {
                assert(i < self.count, "Index out of range")
                result.append(self[i])
            }
            return result
        }
        
        set{
            for (index, i) in input.enumerated() {
                assert(i < self.count, "Index out of range")
                self[i] = newValue[index]
            }
        }
    }
}

var arr = [1,2,3,4,5,6]
arr[[0,3,5]]
arr[[0, 3, 5]] = [-1, -4, -6]
arr

