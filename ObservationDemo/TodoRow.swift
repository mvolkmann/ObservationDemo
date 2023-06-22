import Observation
import SwiftUI

struct TodoRow: View {
    @Bindable var todo: Todo
    @Environment(ViewModel.self) private var vm

    var body: some View {
        HStack {
            // TODO: Is there a way to bind to the done property
            // TODO: of a specific todo?
            // Toggle("", isOn: todo.done)

            /*
             Button {
                 vm.toggleTodo(todo)
             } label: {
                 let name = todo
                     .done ? "checkmark.square" : "square"
                 Image(systemName: name)
             }
             // Without this, tapping either button triggers both!
             .buttonStyle(.borderless)
             */

            Checkbox(label: todo.description, isOn: $todo.done)

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
