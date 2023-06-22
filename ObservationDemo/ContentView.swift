import SwiftUI

struct ContentView: View {
    @Environment(ViewModel.self) private var vm
    @State private var description = ""
    @State private var isHappy = false

    var body: some View {
        VStack(alignment: .leading) {
            Checkbox(label: "Happy?", isOn: $isHappy)
            Text(isHappy ? "Good for you!" : "Maybe tomorrow.")

            HStack {
                TextField("todo description", text: $description)
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.roundedBorder)
                Button("Add") {
                    vm.addTodo(Todo(description))
                    description = ""
                }
                .buttonStyle(.borderedProminent)
                .disabled(description.isEmpty)
            }

            List {
                // This `sorted` method is defined in
                // Extensions/SequenceExtension.swift.
                ForEach(vm.todos.sorted(by: \.description)) { todo in
                    HStack {
                        // TODO: Is there a way to bind to the done property
                        // TODO: of a specific todo?
                        // Toggle("", isOn: todo.done)

                        Button {
                            vm.toggleTodo(todo)
                        } label: {
                            let name = todo
                                .done ? "checkmark.square" : "square"
                            Image(systemName: name)
                        }
                        // Without this, tapping either button triggers both!
                        .buttonStyle(.borderless)

                        // Checkbox(label: todo.description, isOn: todo.done)

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
