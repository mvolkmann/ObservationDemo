import Foundation // for UUID

struct Todo: Equatable, Identifiable {
    var description: String
    var done: Bool
    let id: UUID = .init()

    init(_ description: String, done: Bool = false) {
        self.description = description
        self.done = done
    }
}
