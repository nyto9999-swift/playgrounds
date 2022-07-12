//: [Previous](@previous)
import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()
//: ## try* operators
example(of: "tryMap") {
  // 1
  enum NameError: Error {
    case tooShort(String)
    case unknown
  }

  // 2
  let names = ["Marin", "Shai", "Florent"].publisher

  names
    // 3
    .tryMap { value -> Int in
      // 1
      let length = value.count
      
      // 2
      guard length >= 5 else {
        throw NameError.tooShort(value)
      }
      
      // 3
      return value.count
    }
    .sink(
      receiveCompletion: { print("Completed with \($0)") },
      receiveValue: { print("Got value: \($0)") }
    )
}
//: [Next](@next)

