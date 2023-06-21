import Observation
import SwiftUI

extension Sequence {
    // This returns a new sequenced that is sorted based on a key path.
    func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        return sorted { a, b in
            a[keyPath: keyPath] < b[keyPath: keyPath]
        }
    }
}

struct Todo: Equatable, Identifiable {
    var description: String
    var done: Bool
    let id: UUID = .init()

    init(_ description: String, done: Bool = false) {
        self.description = description
        self.done = done
    }
}

@Observable
class ViewModel {
    var todos: [Todo] = [
        Todo("Cut grass"),
        Todo("Buy Milk", done: true)
    ]

    func addTodo(_ todo: Todo) {
        todos.append(todo)
    }

    func deleteTodo(_ todo: Todo) {
        todos.removeAll { $0 == todo }
    }

    func toggleTodo(_ todo: Todo) {
        // todo.done.toggle()
        if let index = todos.firstIndex(where: { $0 == todo }) {
            todos[index] = Todo(todo.description, done: !todo.done)
        }
    }
}

struct ContentView: View {
    // The @Binding property wrapper allows a view to mutate data
    // that is owned by another view, typically its parent view.
    // The @Bindable marks an instance of a class
    // to which the @Observable macro is applied.
    // It can be used to create a two-way binding

    private let vm = ViewModel()

    @State private var description = ""

    var body: some View {
        VStack {
            HStack {
                TextField("todo description", text: $description)
                    .textFieldStyle(.roundedBorder)
                Button("Add") {
                    vm.addTodo(Todo(description))
                    description = ""
                }
                .buttonStyle(.borderedProminent)
                .disabled(description.isEmpty)
            }

            List {
                ForEach(vm.todos.sorted(by: \.description)) { todo in
                    HStack {
                        // TODO: Is there a way to bind to the done property
                        // TODO: of a specific todo?
                        // Toggle("", isOn: todo.done)
                        Button {
                            vm.toggleTodo(todo)
                        } label: {
                            let name = todo.done ? "checkmark.square" : "square"
                            Image(systemName: name)
                        }
                        // Without this, tapping either button triggers both!
                        .buttonStyle(.borderless)

                        Text(todo.description)
                            .foregroundStyle(todo.done ? .gray : .black)
                            .strikethrough(todo.done)

                        Spacer()

                        Button {
                            vm.deleteTodo(todo)
                        } label: {
                            Image(systemName: "trash")
                        }
                        // Without this, tapping either button triggers both!
                        .buttonStyle(.borderless)
                    }
                }
            }
            .listStyle(.plain)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
