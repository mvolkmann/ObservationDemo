import Observation
import SwiftUI

struct TodoRow: View {
    @Bindable var todo: Todo
    @Environment(ViewModel.self) private var vm

    var body: some View {
        HStack {
            Checkbox(label: todo.description, isOn: $todo.done)
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
