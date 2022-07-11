## Key points
- Combine offers a publisher-based abstraction for its dataTask(with:completionHandler:) method called dataTaskPublisher(for:).
- You can decode Codable-conforming models using the built-in decode operator on a publisher that emits Data values.
- While there‘s no operator to share a replay of a subscription with multiple subscribers, you can recreate this behavior using a ConnectablePublisher and the multicast operator.
