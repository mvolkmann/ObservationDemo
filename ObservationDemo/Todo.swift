import Foundation // for UUID
import Observation

// This needs to be a class instead of a struct to apply @Observable.
@Observable
class Todo: Equatable, Identifiable {
    var description = ""
    var done = false
    let id: UUID = .init()

    init(_ description: String, done: Bool = false) {
        self.description = description
        self.done = done
    }

    static func == (lhs: Todo, rhs: Todo) -> Bool {
        lhs.id == rhs.id
    }
}
