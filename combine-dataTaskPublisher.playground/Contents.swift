import UIKit
import Combine
import Foundation

struct Generations: Codable {
    let count: Int
    let all: [Generation]
    
    enum CodingKeys: String, CodingKey {
        case count
        case all = "results"
    }
}

struct Generation: Codable {
    let name: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}

let url = URL(string: "https://pokeapi.co/api/v2/generation/")!

let subscription = URLSession.shared
    .dataTaskPublisher(for: url)
    .sink(receiveCompletion: { completion in
        
        if case .failure(let err) = completion {
            print("Retrieving data failed with error \(err)")
        }
    }, receiveValue: { data, response in
        
        print("Retrieved data of size \(data.count), response = \(response)")
    })

//       publisher with json api
let subscription2 = URLSession.shared
    .dataTaskPublisher(for: url)
    .map(\.data)
    .decode(type: Generations.self, decoder: JSONDecoder())
    .sink(receiveCompletion: { completion in
        if case .failure(let err) = completion {
            print("Retrieving data failed with error \(err)")
        }
    }, receiveValue:  { object in
        dump(object)
    })

// publish to mutiple subscribers
let publisher = URLSession.shared
    .dataTaskPublisher(for: url)
    .map(\.data)
    .multicast { PassthroughSubject<Data, URLError>() }

let subscription3 = publisher
    .decode(type: Generations.self, decoder: JSONDecoder())
    .sink(receiveCompletion: { completion in
        if case .failure(let err) = completion {
            print("Sink1 Retrieving data failed with error \(err)")
        }
    }, receiveValue: { object in
        dump(object)
    })

let subscription4 = publisher
    .decode(type: Generations.self, decoder: JSONDecoder())
    .sink(receiveCompletion: { completion in
        if case .failure(let err) = completion {
            print("Sink2 Retrieving data failed with error \(err)")
        }
    }, receiveValue: { object in
        dump(object)
    })

let subscriptions = publisher.connect()



