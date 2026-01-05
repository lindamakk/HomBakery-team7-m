
import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = EditProfileViewModel()
    @StateObject private var bookingViewModel = BookingViewModel()
    @StateObject private var coursesViewModel = CoursesViewModel()
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

                    if bookingViewModel.bookedCourses.isEmpty {
                        NoBookedCourses()
                            .frame(maxWidth: .infinity)
                            .padding(.top, 24)
                    } else {
                        LazyVStack(spacing: 12) {
                            ForEach(bookingViewModel.bookedCourses) { course in
                                EventCard(
                                    startDate: TimeInterval(course.fields.startDate),
                                    title: course.fields.title,
                                    location: course.fields.locationName,
                                    time: formattedTime(
                                        start: TimeInterval(course.fields.startDate),
                                        end: TimeInterval(course.fields.endDate)
                                    )
                                )
                            }
                        }
                        .padding(.top, 12)
                    }
                }
                .padding()
            }
            .background(Color("AppBackground").ignoresSafeArea())
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
        .task {
            await coursesViewModel.loadCourses()
            await bookingViewModel.getUserBooking(
                userID: "recWNhwQMScGcvSKs", // لاحقًا تجي من UserRepository
                allCourses: coursesViewModel.courses
            )
        }}
}
