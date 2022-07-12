# Tutorial combine api swiftui 

## Key points
- With SwiftUI, your UI is a function of your state. You cause your UI to render itself by committing changes to the data declared as the view’s state, among other view dependencies. You learned various ways to manage state in SwiftUI:

- Use @State to add local state to a view and @ObservedObject to add a dependency on an external ObservableObject in your Combine code.
- Use onReceive view modifier to subscribe an external publisher directly.
- Use @Environment to add a dependency to one of the system-provided environment settings and @EnvironmentObject for your own custom environment objects.
