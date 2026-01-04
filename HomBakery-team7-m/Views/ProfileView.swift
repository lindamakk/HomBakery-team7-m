
import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = EditProfileViewModel()

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 24) {
                    ProfileCard(
                        name: $viewModel.name,
                        isEditing: $viewModel.isEditing,
                        onEditToggle: { viewModel.toggleEditing() },
                        onSave: {print("Pressed Done button")
                            Task { await viewModel.saveChanges() }
                        }
                    )

                    Divider()
                    Text("Booked courses")
                        .font(.system(size: 24, weight: .semibold))
                        .padding(.top, 4)

                    NoBookedCourses()
                        .frame(maxWidth: .infinity)
                        .padding(.top, 24)
                }
                .padding()
            }
            .background(Color("AppBackground").ignoresSafeArea())
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
