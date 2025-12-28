import SwiftUI

struct BottomSheet: View {

    @Environment(\.dismiss) private var dismiss

    var sheetTitle: String = "Sign in"

    @State private var email = ""
    @State private var password = ""
//    @State private var isPasswordVisible = false

    var body: some View {
        ZStack {
            // خلفية رمادية فاتحة
            Color(.systemGray6)
                .ignoresSafeArea()

            VStack(spacing: 0) {

                // صورة الهيدر
                Image("bakery_header") // تأكدي من وجودها في Assets
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 160)
                    .clipped()

                // الكرت الأبيض
                VStack(spacing: 24) {

                    // Drag Indicator
                    Capsule()
                        .fill(Color.gray.opacity(0.4))
                        .frame(width: 40, height: 5)
                        .padding(.top, 8)

                    // العنوان + زر الإغلاق
                    ZStack {
                        Text(sheetTitle)
                            .font(.title2)
                            .fontWeight(.bold)

                        HStack {
                            Spacer()
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: "xmark")
                                    .foregroundColor(.gray)
                                    .padding(10)
                                    .background(Color.gray.opacity(0.15))
                                    .clipShape(Circle())
                            }
                        }
                    }

             
                    
                    //Email
                    Textfield(label: "Email",  textInput: "", isPassword: false,)
                    
                    //password
                    Textfield(label: "Password",  textInput: "", isPassword: true,)
                    
                    
                    ButtonView(label: "Sign In", action: {})

                    Spacer()
                }
                .padding(24)
                .background(Color(.systemGray6))
                .cornerRadius(30, corners: [.topLeft, .topRight])
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
// للمعاينة
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheet()
    }
}
