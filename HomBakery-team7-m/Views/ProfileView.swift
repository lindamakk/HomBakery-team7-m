
import SwiftUI
struct ProfileView: View {
    @StateObject private var viewModel = EditProfileViewModel()

    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    VStack(spacing: 24) {
                        ProfileCard(
                            name: $viewModel.name,
                            isEditing: $viewModel.isEditing,
                            onEditToggle: { viewModel.toggleEditing() },
                            onSave: {
                                print("Pressed Done button")
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
                .task {
                    viewModel.loadUser()
                }
                .background(Color("AppBackground").ignoresSafeArea())
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
            }

            // ✅ SUCCESS TOAST
            if viewModel.showSuccess {
                Text("Name updated successfully ✅")
                    .padding()
                    .background(Color.green.opacity(0.9))
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .zIndex(1)
            }

            // ✅ LOADING OVERLAY
            if viewModel.isSaving {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()

                ProgressView("Saving...")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
            }
        }
        .animation(.easeInOut, value: viewModel.showSuccess)
    }
}
