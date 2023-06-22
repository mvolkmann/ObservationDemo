import SwiftUI

struct Checkbox: View {
    var label: String
    @Binding var isOn: Bool

    var body: some View {
        // This approach only works in macOS.
        // Toggle(isOn: $isOn) { Text(label) }.toggleStyle(.checkbox)

        Button {
            isOn.toggle()
        } label: {
            Image(systemName: isOn ? "checkmark.square" : "square")
            Text(label)
        }
        .buttonStyle(.plain)
    }
}
