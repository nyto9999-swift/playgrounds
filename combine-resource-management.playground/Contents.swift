import UIKit
import Combine
//share()
//passed by reference, only request onece
let shared = URLSession.shared
    .dataTaskPublisher(for: URL(string: "https://jsonplaceholder.typicode.com/todos/1")!)
    .map(\.data)
    .print("shared")
    .share()

print("subscribing first")

let subscription1 = shared.sink(
    receiveCompletion: { _ in },
    receiveValue: { print("subscription1 received: '\($0)'") }
)

print("subscribing second")
let subscription2 = shared.sink(
    receiveCompletion: { _ in },
    receiveValue: { print("subscription2 received: '\($0)'") }
)

//muticast()
let subject = PassthroughSubject<Data, URLError>()

let multicasted = URLSession.shared
    .dataTaskPublisher(for: URL(string: "https://www.raywenderlich.com")!)
    .map(\.data)
    .print("multicast")
    .multicast(subject: subject)

let subscription3 = multicasted
    .sink(
        receiveCompletion: { _ in },
        receiveValue: { print("subscription1 received: '\($0)'") }
    )
let subscription4 = multicasted
    .sink(
        receiveCompletion: { _ in },
        receiveValue: { print("subscription2 received: '\($0)'") }
    )

let cancellable = multicasted.connect()


//Future
/*note: Future is a class, it performs work and returns a single result, not a stream of results, so the use cases are narrower than full-blown publishers.*/
func performSomeWork() throws -> Int {
    print("Performing some work and returning a result")
    return 5
}

let future = Future<Int, Error> { fulfill in
    do {
        let result = try performSomeWork()
        fulfill(.success(result))
    } catch {
        fulfill(.failure(error))
    }
}

print("Subscribing to future....")

let subscription5 = future
    .sink(
        receiveCompletion: {_ in print("subscription5 completed") },
        receiveValue: { print("subscription5 received: \($0)") }
    )

let subscription6 = future
    .sink(
        receiveCompletion: {_ in print("subscription6 completed") },
        receiveValue: { print("subscription6 received: \($0)") }
    )

