import SwiftUI

struct Textfield: View {
    
    

    var label: String // textfeild label
    @State  var textInput: String = "" // text feild input
    var isPassword:  Bool = false // if feild id password
    
    
    @State var isPasswordVisible: Bool = true

    var body: some View {
    
        
        VStack(alignment: .leading, spacing: 8) {
            Text(label)
                .font(.subheadline)
                .fontWeight(.semibold)

            HStack {
                Group {
                    if isPasswordVisible {
                        TextField(textInput, text: $textInput, )
                    } else {
                        SecureField(textInput, text: $textInput)
                    }
                }

                isPassword==true ?    Button {
                    isPasswordVisible.toggle()
                } label: {
                    Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                } : nil
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.3))
            )
        }

    }
}
