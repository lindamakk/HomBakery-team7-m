import SwiftUI

struct ProfileCard: View {
    @Binding var name: String
    @Binding var isEditing: Bool  // editing state moved to ViewModel
    // called when button pressed
    var onEditToggle: () -> Void
    // optional callback for saving
    var onSave: () -> Void?

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ZStack(alignment:.bottomTrailing){
                    Image("Profile")
                        .resizable()
                        .frame(width: 46, height: 46)
                        .background(Color(hue: 0.1, saturation: 0.3, brightness: 0.8))
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.black))

                    Image(systemName: "plus")
                        .font(.caption)
                        .padding(2)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .clipShape(Circle())
                }

                TextField("Name", text: $name)
                    .disabled(!isEditing)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: .infinity)

                Button(action: {
                    if isEditing {
                        onSave()
                    }
                    onEditToggle()
                }) {
                    Text(isEditing ? "Done" : "Edit")
                        .fontWeight(.bold)
                }
                .padding(.leading, 8)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
    }
}

//
//struct ProfileCard: View {
//    @Binding var name: String
//    @State private var isEditing: Bool = false
//    var onSave: (() async -> Void)?  // callback for Done
//
//    @State private var isSaving = false
//    @State private var errorMessage: String?
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            HStack {
//                ZStack(alignment:.bottomTrailing){
//                    Image("Profile")
//                        .resizable()
//                        .frame(width: 46, height: 46)
//                        .background(Color(hue: 0.1, saturation: 0.3, brightness: 0.8))
//                        .clipShape(Circle())
//                        .overlay(Circle().stroke(Color.black))
//
//                    Image(systemName: "plus")
//                        .font(.caption)
//                        .padding(2)
//                        .foregroundColor(.white)
//                        .background(Color.accentColor)
//                        .clipShape(Circle())
//                }
//
//                TextField("Name", text: $name)
//                    .disabled(!isEditing)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .frame(maxWidth: .infinity)
//
//                Button(action: {
//
//
//                    if isEditing {
//                        Task {
//                            isSaving = true
//                            do {
//                                 await onSave?()
//                                errorMessage = nil
//                            } catch {
//                                errorMessage = "Failed to save"
//                            }
//                            isSaving = false
//                        }
//                    }
//                    isEditing.toggle()
//                }) {
//                    if isSaving {
//                        ProgressView()
//                            .progressViewStyle(CircularProgressViewStyle())
//                    } else {
//                        Text(isEditing ? "Done" : "Edit")
//                            .fontWeight(.bold)
//                    }
//                }
//                .padding(.leading, 8)
//            }
//
//            if let errorMessage = errorMessage {
//                Text(errorMessage)
//                    .font(.caption)
//                    .foregroundColor(.red)
//            }
//        }
//        .padding()
//        .background(Color(.systemBackground))
//        .cornerRadius(10)
//    }
//}
