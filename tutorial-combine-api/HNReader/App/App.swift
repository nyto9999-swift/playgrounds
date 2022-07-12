import SwiftUI
import Combine

@main
struct HNReader: App {
  let viewModel = ReaderViewModel()
    let userSettings = Settings()
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        userSettings.$keywords
            .map { $0.map { $0.value }}
            .assign(to: \.filter, on: viewModel)
            .store(in: &subscriptions)
    }

  var body: some Scene {
    WindowGroup {
      ReaderView(model: viewModel)
            .environmentObject(userSettings)
            .onAppear {
                viewModel.fetchStories()
            }
    }
  }
}
