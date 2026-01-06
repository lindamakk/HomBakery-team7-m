
import SwiftUI


struct ProfileView: View {
    @StateObject private var viewModel = EditProfileViewModel()
    @StateObject private var bookingViewModel = BookingViewModel()
    @StateObject private var coursesViewModel = CoursesViewModel()
    
    var body: some View {
        
        ZStack {
            
            
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        // 1. Profile Information
                        ProfileCard(
                            name: $viewModel.name,
                            isEditing: $viewModel.isEditing,
                            onEditToggle: { viewModel.toggleEditing() },
                            onSave: {
                                Task { await viewModel.saveChanges() }
                            }
                        )

                        Divider()
                        
                        Text("Booked courses")
                            .font(.system(size: 24, weight: .semibold))
                            .padding(.top, 4)

                        // 2. Loading or Empty State Logic
                        if bookingViewModel.isLoading {
                            ProgressView()
                                .padding(.top, 24)
                        } else if bookingViewModel.bookedCourses.isEmpty {
                            NoBookedCourses()
                                .frame(maxWidth: .infinity)
                                .padding(.top, 24)
                        } else {
                            // 3. Display Booked Events
                            LazyVStack(spacing: 12) {
                                ForEach(bookingViewModel.bookedCourses) { course in
                                    CourseCard(course: course) {
                                       
                                        Task {
    //
    //                                            await chefsViewModel.loadChefById(by: course.fields.chefID)
    //
    //                                        chefName = chefsViewModel.selectedChef?.fields.name ?? "Unknown Chef"
    //
    //                                            await coursesViewModel.loadCoursesById(by: course.id)
                                            }
                                    }
                                    
                                    .disabled(coursesViewModel.isLoading)
                                }
    //
                            }
                          
                        }
                    }
                    .padding()
                }
                .background(Color("AppBackground").ignoresSafeArea())
                .navigationTitle("Profile")
                .navigationBarTitleDisplayMode(.inline)
            }
            .task {
                //load user from disk
                UsersRepository.shared.loadCurrentUser()
                //paass it to name to apper in view
                    viewModel.loadUser()
                // Sequential loading to ensure cross-referencing works
                await coursesViewModel.loadCourses()
                await bookingViewModel.getUserBooking(
                    userID: "recK8QGYcpM8667s9",
                    allCourses: coursesViewModel.courses
                )
            
        }
            //second layer
            // ✅ SUCCESS TOAST
            if viewModel.showSuccess {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                SuccessAlert(show: $viewModel.showSuccess)
                    .transition(.scale.combined(with: .opacity))
                .zIndex(1) }
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
