import UIKit

let queue = OperationQueue()
let subscription = queue.publisher(for: \.operationCount)
    .sink { print("Outstanding operations in queue: \($0)")}

class TestObjectc: NSObject {
    @objc dynamic var integerProperty: Int = 0
    @objc dynamic var stringProperty: String = ""
    @objc dynamic var arrayProperty: [Float] = []
}
let obj = TestObjectc()

    // cancel init by adding options: []
let subscription1 = obj.publisher(for: \.integerProperty, options: [])

    // get two separate values every time a change occurs
    .sink { print("integerProperty changes to \($0)")}
let subscription2 = obj.publisher(for: \.stringProperty, options: [.prior])
  .sink { print("stringProperty changes to \($0)")}

    //default
let subscription3 = obj.publisher(for: \.arrayProperty)
  .sink { print("arrayProperty changes to \($0)")}

obj.integerProperty = 100
obj.integerProperty = 200
obj.stringProperty = "Hello"
obj.arrayProperty = [1.0]
obj.stringProperty = "World"
obj.arrayProperty = [1.0, 2.0]

class MonitorObject: ObservableObject {
    @Published var someProperty = false
    @Published var someOtherProperty = ""
}

/*objecWillChange is a ObserableObjectPublisher, Unfortunately, you can‘t know which property actually changed. This is designed to work very well with SwiftUI */
let object = MonitorObject()
let subscription4 = object.objectWillChange.sink { print("object will change")}

object.someProperty = true
object.someOtherProperty = "Hellow world"
