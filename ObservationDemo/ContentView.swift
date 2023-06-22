import Observation
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
                    TodoRow(todo: todo)
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
