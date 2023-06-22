import Observation

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
        // todo.done.toggle() // This doesn't work.
        if let index = todos.firstIndex(where: { $0.id == todo.id }) {
            todos[index] = Todo(todo.description, done: !todo.done)
        }
    }
}
