## Key points

- You call methods that perform operations on output from publishers “operators”.
- Operators are also publishers.
- Transforming operators convert input from an upstream publisher into output that is suitable for use downstream.
- Marble diagrams are a great way to visualize how each Combine operators work.
- Be careful when using any operators that buffer values such as collect or flatMap to avoid memory problems.
- Be mindful when applying existing knowledge of functions from Swift standard library. Some similarly-named Combine operators work the same while others work entirely differently.
- It’s common chaining multiple operators together in a subscription to create complex and compound transformations on events emitted by a publisher.
