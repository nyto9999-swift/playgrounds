import Foundation

public func example(of description: String,
                    action: () -> Void) {
  print("\n——— Example of:", description, "———")
  action()
}


class TimeLogger: TextOutputStream {
  private var previous = Date()
  private let formatter = NumberFormatter()

  init() {
    formatter.maximumFractionDigits = 5
    formatter.minimumFractionDigits = 5
  }

  func write(_ string: String) {
    let trimmed = string.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !trimmed.isEmpty else { return }
    let now = Date()
    print("+\(formatter.string(for: now.timeIntervalSince(previous))!)s: \(string)")
    previous = now
  }
}
