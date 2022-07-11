## Key points
- Key-Value Observing mostly relies on the Objective-C runtime and methods of the NSObject protocol.
- Many Objective-C classes in Apple frameworks offer some KVO-compliant properties.
- You can make your own properties observable, provided they are classes conforming to NSObject, and marked with the @objc dynamic attributes.
- You can also conform to ObservableObject and use @Published for your properties. The compiler-generated objectWillChange publisher triggers every time one of the @Published properties changes (but doesn’t tell you which one changed).

```
OperationQueue(), KVO, (ObserableObject, @Published, objectWillchange<- publisher)
```
