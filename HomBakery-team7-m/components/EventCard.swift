//
//  EventCard.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//
import SwiftUI

struct EventCard: View {

    let month: String
    let day: String
    let title: String
    let location: String
    let time: String
    let onTap: () -> Void

    var body: some View {
        HStack(spacing: 16) {

            // 📅 Date
            VStack(spacing: 4) {
                Text(month)
                    .font(.headline)
                    .foregroundColor(Color.brown)

                Text(day)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.brown)
            }
            .frame(width: 60)

            // │ Divider
            Rectangle()
                .fill(Color.brown)
                .frame(width: 4,height: 100)
                .cornerRadius(2)

            // 🧁 Details
            VStack(alignment: .leading, spacing: 8) {

                Text(title)
                    .font(.headline)
                    .foregroundColor(.black)

                HStack(spacing: 6) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.brown)
                        .font(.caption)

                    Text(location)
                        .font(.subheadline)
                        .foregroundColor(.black)
                }

                HStack(spacing: 6) {
                    Image(systemName: "hourglass")
                        .foregroundColor(.brown)
                        .font(.caption)

                    Text(time)
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
            }

            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.15), radius: 10, x: 0, y: 4)
        .onTapGesture {
            onTap()
        }
    }
}

#Preview {
    EventCard(
        month: "Dec",
        day: "15",
        title: "Babka dough",
        location: "Riyadh, Alnarjis",
        time: "4:00 pm"
    ) {}
    .padding()
    .background(Color.gray.opacity(0.2))
}

