import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()
//: ## Never
example(of: "Never sink") {
  Just("Hello")
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)
}

enum MyError: Error {
  case ohNo
}

example(of: "setFailureType") {
  Just("Hello")
    .setFailureType(to: MyError.self)
    .sink(
      receiveCompletion: { completion in
        switch completion {
        // 2
        case .failure(.ohNo):
          print("Finished with Oh No!")
        case .finished:
          print("Finished successfully!")
        }
      },
      receiveValue: { value in
        print("Got value: \(value)")
      }
    )
    .store(in: &subscriptions)
}

example(of: "assign(to:on:)") {
  // 1
  class Person {
    let id = UUID()
    var name = "Unknown"
  }

  // 2
  let person = Person()
  print("1", person.name)

  Just("Shai")
    .handleEvents( // 3
      receiveCompletion: { _ in print("2", person.name) }
    )
    .assign(to: \.name, on: person) // 4
    .store(in: &subscriptions)
}

