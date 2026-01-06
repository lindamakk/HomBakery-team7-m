# HomBakery 🥐

HomBakery is a modern iOS application built with **SwiftUI** designed for baking enthusiasts. Users can explore various baking courses, view detailed course information (including chef details and map locations), and manage their bookings in real-time.

## 🌟 Features

* **Course Discovery**: Browse a curated list of baking courses.
* **Detailed Insights**: View course descriptions, difficulty levels, duration, and locations via MapKit.
* **Booking System**: Real-time booking and cancellation of courses.
* **User Profile**: Manage personal details and view a history of booked courses.

## 🏗 Architecture & Structure

The project follows the **MVVM (Model-View-ViewModel)** design pattern to ensure a clean separation of concerns and testability.

### Project Structure:

* **Views**: SwiftUI views representing the UI (e.g., `CourseDetailsView`, `ProfileView`).
* **ViewModels**: Contains business logic and state management using `@Published` and `Async/Await`.
* **Networking**: A robust layer using a `NetworkManager` protocol and `URLSession` for API calls.
* **Components**: Reusable UI elements like `EventCard`, `ButtonView`, and `NetworkImage`.
* **Helpers**: Extensions and utility functions (e.g., Date formatters, API constants).
* **Models**: Codable structures that match the API response schema.

## 🚀 Getting Started

### Prerequisites

* **Xcode**: Version 15.0 or later.
* **iOS**: Target 17.0 or later.
* **Swift**: Version 5.9+.

### Installation

1. **Clone the repository**:
```bash
git clone https://github.com/your-username/HomBakery-team7-m.git

```


2. Open `HomBakery-team7-m.xcodeproj` in Xcode.
3. Ensure your **API Token** is correctly set in `APIConstants.swift`.
4. Build and Run (`Cmd + R`) on your preferred Simulator or Device.

## 📱 Usage

To test the full functionality of the app, use the following test credentials on the login screen:

* **User**: `amina@oconnor.com`
* **Password**: `amina@oconnor.com`

## 🌐 API Reference

The app integrates with a **Private Test API** 

* **Base URL**: Provided in `APIConstants`.
* **Endpoints**:
* `GET /Chef`: Fetch all available chefs.
* `GET /Chef/{id}`: Fetch a spacific chef.
* `GET /User`: Fetch all available users.
* `Put /User`: update a spacific user.
* `GET /Courses`: Fetch all available courses.
* `GET /Courses/{id}`: Fetch a spacific courses.
* `GET /Booking`: Fetch user-specific bookings.
* `POST /Booking`: Create a new booking record.
* `DELETE /Booking/{id}`: Remove a booking.

## 📝 Conclusion

HomBakery demonstrates a scalable approach to building iOS apps with SwiftUI. By combining a component-based UI structure with a clean MVVM architecture and robust error handling, the app provides a seamless user experience from discovery to booking.

---

**Would you like me to add a section on how to contribute or how to set up the environment variables for the API token?**
