//
//  EventCard.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//
import SwiftUI

struct EventCard: View {

    let startDate: TimeInterval
    let title: String
    let location: String
    let time: String

    var body: some View {
        
        HStack(spacing: 16) {

            // MARK: - Date (Dec / 15)
            VStack(spacing: 4) {
                Text(formattedMonth(from: startDate))
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.brown)

                Text(formattedDay(from: startDate))
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.brown)
            }
            .frame(width: 60)

            // Divider
            Rectangle()
                .fill(Color.brown.opacity(0.6))
                .frame(width: 3, height: 60)

            // MARK: - Content
            VStack(alignment: .leading, spacing: 8) {

                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)

                HStack(spacing: 6) {
                    Image(systemName: "location")
                        .foregroundColor(.gray)
                    Text(location)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }

                HStack(spacing: 6) {
                    Image(systemName: "hourglass")
                        .foregroundColor(.gray)
                    Text(time)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }

            Spacer()
        }
        .onAppear {
//                    print("📦 EventCard loaded →", title)
                }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 8, y: 4)
        )
    }
}
#Preview {
    EventCard(
        startDate: Date().timeIntervalSince1970,
        title: "Babka dough",
        location: "Riyadh, Alnarjis",
        time: "4:00 PM – 6:00 PM"
    )
    .padding()
    .background(Color(.systemGray6))
}
