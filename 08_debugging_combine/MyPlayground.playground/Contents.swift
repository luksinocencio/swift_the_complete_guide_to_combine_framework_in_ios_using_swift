import UIKit
import Combine

guard let url = URL(string: "https://jsonplacheholder.typicodde.com/posts") else {
    fatalError("Invalid URL")
}

let request = URLSession.shared.dataTaskPublisher(for: url)

request
    .print()
    .handleEvents(
        receiveSubscription: { _ in print("received subscription")},
        receiveOutput: {_, _ in print("received output")},
        receiveCompletion: { _ in print("received completion")},
        receiveCancel: { print("received cancel")},
        receiveRequest: { _ in print("received request")}
    )
    .sink(
        receiveCompletion: { print($0) },
        receiveValue: { data, response in
            print(data)
        }
    )

