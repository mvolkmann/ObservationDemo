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
}
