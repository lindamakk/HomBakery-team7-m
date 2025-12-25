import SwiftUI

struct Textfield: View {
    
    var label: String
    @State private var textfeildText: String = ""
    var placeholder: String
    @State private var isPasswordVisible: Bool = false
    
    // Custom initializer to accept arguments for label and placeholder
    init(label: String, placeholder: String) {
        self.label = label
        self.placeholder = placeholder
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .fontWeight(.semibold)
            TextField(placeholder, text: $textfeildText)
                .padding()
                .background(Color.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
        }
    }
}
