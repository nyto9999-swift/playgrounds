import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()
//
//example(of: "collect") {
//  ["A", "B", "C", "D", "E"].publisher
//    .collect(2)
//    .sink(receiveCompletion: { print($0) },
//          receiveValue: { print($0) })
//    .store(in: &subscriptions)
//    /*
//     .collect()
//     output ["A", "B", "C", "D", "E"]
//
//     .collect(2)
//     ["A", "B"]
//     ["C", "D"]
//     ["E"]
//     finished
//     */
//}

//example(of: "map") {
//    let formatter = NumberFormatter()
//    formatter.numberStyle = .spellOut
//
//    //2
//    [123, 4, 56].publisher
//        .map { formatter.string(for: NSNumber(integerLiteral: $0)) ?? ""
//        }
//        .sink(receiveValue: {print($0)})
//        .store(in: &subscriptions)
//    /*
//     output
//     one hundred twenty-three
//     four
//     fifty-six
//     */
//}

//example(of: "mapping key paths") {
//    let publisher = PassthroughSubject<Coordinate, Never>()
//
//    publisher
//    .map(\.x, \.y)
//    .sink(receiveValue: { x, y in
//        print("The coordinate at (\(x), \(y)) is in quadrant", quadrantOf(x: x, y: y))
//    })
//    .store(in: &subscriptions)
//
//    publisher.send(Coordinate(x: 10, y: -8))
//    publisher.send(Coordinate(x: 0, y: 5))
//}

    
//example(of: "tryMap") {
//    Just("Directory name that does not exist")
//        .tryMap({try FileManager.default.contentsOfDirectory(atPath: $0)})
//        .sink(receiveCompletion: {print($0)},
//              receiveValue: {print($0)})
//        .store(in: &subscriptions)
//}

//example(of: "flatMap") {
//
//  func decode(_ codes: [Int]) -> AnyPublisher<String, Never> {
//    Just(
//      codes
//        .compactMap { code in
//          guard (32...255).contains(code) else { return nil }
//          return String(UnicodeScalar(code) ?? " ")
//        }
//        .joined()
//    )
//    .eraseToAnyPublisher()
//  }
//
//[72, 101, 108, 108, 111, 44, 32, 87, 111, 114, 108, 100, 33]
//    .publisher
//    .collect()
//    .flatMap(decode)
//    .sink(receiveValue: {print($0)})
//    .store(in: &subscriptions)
//
//    //ASCII character conver into a string
//flatMap emits the value publishers’ values from P1 and P2, but ignores P3 because maxPublishers is set to 2
//}

//[72, 101, 108, 108, 111, 44, 32, 87, 111, 114, 108, 100, 33]
//    .publisher
//    .collect()
//    .flatMap(maxPublishers: .max(2)) { $0.value }
//    .sink(receiveValue: {print($0)})
//    .store(in: &subscriptions)
//
//    //ASCII character conver into a string
//}

//example(of: "replaceNil") {
//    ["A", nil, "C"].publisher
//        .eraseToAnyPublisher()
//        .replaceNil(with: "_")
//        .sink(receiveValue: {print($0)})
//        .store(in: &subscriptions)
//    //A _ C
//}
//
//example(of: "replaceEmpty(with:)") {
//  // 1
//  let empty = Empty<Int, Never>()
//
//  // 2
//  empty
//    .replaceEmpty(with: 1)
//    .sink(receiveCompletion: { print($0) },
//          receiveValue: { print($0) })
//    .store(in: &subscriptions)
//}

//example(of: "scan") {
//    var dialyGainLoss: Int {.random(in: -10...10)}
//
//    let august2019 = (0..<22)
//        .map({ _ in dialyGainLoss})
//        .publisher
//
//    august2019
//        .scan(50) {latest, current in
//            max(0, latest + current)
//
//        }
//        .sink(receiveValue: { _ in })
//        .store(in: &subscriptions)
//}

//example(of: "Create a phone number lookup") {
//  let contacts = [
//    "603-555-1234": "Florent",
//    "408-555-4321": "Marin",
//    "217-555-1212": "Scott",
//    "212-555-3434": "Shai"
//  ]
//  
//  func convert(phoneNumber: String) -> Int? {
//    if let number = Int(phoneNumber),
//      number < 10 {
//      return number
//    }
//
//    let keyMap: [String: Int] = [
//      "abc": 2, "def": 3, "ghi": 4,
//      "jkl": 5, "mno": 6, "pqrs": 7,
//      "tuv": 8, "wxyz": 9
//    ]
//
//    let converted = keyMap
//      .filter { $0.key.contains(phoneNumber.lowercased()) }
//      .map { $0.value }
//      .first
//
//    return converted
//  }
//
//  func format(digits: [Int]) -> String {
//    var phone = digits.map(String.init)
//                      .joined()
//
//    phone.insert("-", at: phone.index(
//      phone.startIndex,
//      offsetBy: 3)
//    )
//
//    phone.insert("-", at: phone.index(
//      phone.startIndex,
//      offsetBy: 7)
//    )
//
//    return phone
//  }
//
//  func dial(phoneNumber: String) -> String {
//    guard let contact = contacts[phoneNumber] else {
//      return "Contact not found for \(phoneNumber)"
//    }
//
//    return "Dialing \(contact) (\(phoneNumber))..."
//  }
//  
//  let input = PassthroughSubject<String, Never>()
//    input
//        .map(convert(phoneNumber:))
//        .replaceNil(with: 0)
//        .collect(10)
//        .map(format(digits:))
//        .map(dial(phoneNumber:))
//        .sink(receiveValue: {print($0)})
//        .store(in: &subscriptions)
//  
//  "0!1234567".forEach {
//    input.send(String($0))
//  }
//  
//  "4085554321".forEach {
//    input.send(String($0))
//  }
//  
//  "A1BJKLDGEH".forEach {
//    input.send("\($0)")
//  }
//}




 

