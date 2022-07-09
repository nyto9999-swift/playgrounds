import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()
//
//example(of: "filter") {
//  let numbers = (1...10).publisher
//
//  numbers
//    .filter { $0.isMultiple(of: 3) }
//    .sink(receiveValue: { n in
//      print("\(n) is a multiple of 3!")
//    })
//    .store(in: &subscriptions)
//}
//
//example(of: "removeDuplicates") {
//
//  let words = "hey hey there! want to listen to mister mister ?"
//                  .components(separatedBy: " ")
//                  .publisher
//  words
//    .removeDuplicates()
//    .sink(receiveValue: { print($0) })
//    .store(in: &subscriptions)
//}
//
//example(of: "compactMap") {
//  let strings = ["a", "1.24", "3",
//                 "def", "45", "0.23"].publisher
//
//  strings
//    .compactMap { Float($0) }
//    .sink(receiveValue: {
//      print($0)
//    })
//    .store(in: &subscriptions)
//}

//example(of: "ignoreOutput") {
//  let numbers = (1...10_000).publisher
//
//  numbers
//    .ignoreOutput()
//    .sink(receiveCompletion: { print("Completed with: \($0)") },
//          receiveValue: { print($0) })
//    .store(in: &subscriptions)
//}

//example(of: "first(where:)") {
//
//  let numbers = (1...9).publisher
//
//  numbers
//    .print()
//    .last(where: { $0 % 2 == 0 })
//    .sink(receiveCompletion: { print("Completed with: \($0)") },
//          receiveValue: { print($0) })
//    .store(in: &subscriptions)
//
//    numbers.print()
//    // by using .first, subscription will be canceled, once the condiction is true
//    // by using .last, it is opposite, bc the range is given
//}

//example(of: "last(where:)") {
//  let numbers = PassthroughSubject<Int, Never>()
//
//  numbers
//    .last(where: { $0 % 2 == 0 })
//    .sink(receiveCompletion: { print("Completed with: \($0)") },
//          receiveValue: { print($0) })
//    .store(in: &subscriptions)
//
//  numbers.send(1)
//  numbers.send(2)
//  numbers.send(3)
//  numbers.send(4)
//  numbers.send(5)
//  numbers.send(completion: .finished) // there is no way to determine the last value matching the criteria, so you should add this line
//}

//example(of: "dropFirst") {
//  let numbers = (1...10).publisher
//
//  numbers
//    .dropFirst(2)
//    .sink(receiveValue: { print($0) })
//    .store(in: &subscriptions)
//}

//example(of: "drop(while:)") {
//  let numbers = (1...10).publisher
//
//  numbers
//    .drop(while: { $0 % 5 != 0 })
//    .sink(receiveValue: { print($0) })
//    .store(in: &subscriptions)
//}

/*important difference is that filter never stops evaluating its condition for all values published by the upstream publisher. Even after the condition of filter evaluates to true, further values are still “questioned” and your closure must answer the question: “Do you want to let this value through?”.
 
 On the contrary, drop(while:)’s predicate closure will never be executed again after the condition is met. To confirm this, replace the following line:*/

//example(of: "drop(untilOutputFrom:)") {
//  let isReady = PassthroughSubject<Void, Never>()
//  let taps = PassthroughSubject<Int, Never>()
//
//  taps
//    .drop(untilOutputFrom: isReady)
//    .sink(receiveValue: { print($0) })
//    .store(in: &subscriptions)
//
//  (1...5).forEach { n in
//    taps.send(n)
//
//    if n == 3 {
//      isReady.send()
//    }
//  }
//}

//example(of: "prefix") {
//  let numbers = (1...10).publisher
//
//  numbers
//    .prefix(2)
//    .sink(receiveCompletion: { print("Completed with: \($0)") },
//          receiveValue: { print($0) })
//    .store(in: &subscriptions)
//}

//example(of: "prefix(while:)") {
//  let numbers = (1...10).publisher
//
//  numbers
//    .prefix(while: { $0 < 3 })
//    .sink(receiveCompletion: { print("Completed with: \($0)") },
//          receiveValue: { print($0) })
//    .store(in: &subscriptions)
//}

//example(of: "prefix(untilOutputFrom:)") {
//  let isReady = PassthroughSubject<Void, Never>()
//  let taps = PassthroughSubject<Int, Never>()
//
//  taps
//    .prefix(untilOutputFrom: isReady)
//    .sink(receiveCompletion: { print("Completed with: \($0)") },
//          receiveValue: { print($0) })
//    .store(in: &subscriptions)
//
//  (1...5).forEach { n in
//    taps.send(n)
//
//    if n == 2 {
//      isReady.send()
//    }
//  }
//}

let collection = (1...100).publisher

    collection
    .dropFirst(50)
    .prefix(20)
    .filter({ $0 % 2 == 0})
    .sink(receiveCompletion: {print($0)}, receiveValue: {print($0)})
    .store(in: &subscriptions)



