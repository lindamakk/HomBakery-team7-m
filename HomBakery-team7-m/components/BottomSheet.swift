



import SwiftUI

struct BottomSheet: View {

    var sheetTitle: String = "Sign In"
    
    
    var body: some View {
        ZStack {
            // خلفية رمادية فاتحة جداً كما في الصورة
            Color(UIColor.systemGray6)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0) {
                // الجزء العلوي: الصورة (اختياري)
                Image("bakery_header") // استبدلها باسم صورتك في Assets
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 150)
                    .clipped()
                
                // حاوية بيضاء للعناصر (الكرت)
                VStack(alignment: .leading, spacing: 20) {
                    
                    // عنوان الصفحة وزر الإغلاق
                    HStack {
                        Spacer()
                        Text(sheetTitle)
                            .font(.headline)
                            .fontWeight(.bold)
                        Spacer()
                       Button(action: { /* إغلاق الصفحة */ }) {                            Image(systemName: "xmark.circle.fill")                                .foregroundColor(.gray)
                             .font(.title2)
                       }
                    }
                    .padding(.bottom, 10)

                    
         
                    
                    Spacer()
                }
                .padding(25)
                .background(Color.white)
                .cornerRadius(30, corners: [.topLeft, .topRight]) // زوايا علوية فقط
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}


// كود مساعد لجعل الزوايا منحنية من جهات محددة فقط
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

// للمعاينة
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheet()
    }
}
