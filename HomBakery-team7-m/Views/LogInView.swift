import SwiftUI


import SwiftUI
struct LogInView: View {

    var onLoginSuccess: () -> Void
    var sheetTitle: String = "Sign in"

    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6).ignoresSafeArea()

                VStack(spacing: 0) {

                    Image("bakery_header")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 160)
                        .clipped()

                    VStack(spacing: 24) {

                        Capsule()
                            .fill(Color.gray.opacity(0.4))
                            .frame(width: 40, height: 5)
                            .padding(.top, 8)

                        Text(sheetTitle)
                            .font(.title2)
                            .fontWeight(.bold)

                        Textfield(label: "Email", textInput: $viewModel.email, isPassword: false)

                        Textfield(label: "Password", textInput: $viewModel.password, isPassword: true)

                        ButtonView(label: "Sign In") {
                            Task {
                                let success = await viewModel.login()
                                if success {
                                    onLoginSuccess()  // dismiss sheet
                                }
                            }
                        }

                        Spacer()
                    }
                    .padding(24)
                }
            }
            .alert(item: $viewModel.error) { error in
                Alert(
                    title: Text("Error"),
                    message: Text(error.localizedDescription),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}
