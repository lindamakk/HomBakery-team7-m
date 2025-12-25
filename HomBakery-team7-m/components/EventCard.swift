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

    let onTap: () -> Void   // 👈 بس كذا

    var body: some View {
        HStack {
            Text("\(month)\n\(day)")
            VStack(alignment: .leading) {
                Text(title)
                Text(location)
                Text(time)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .onTapGesture {
            onTap()
        }
    }
}


#Preview {
    EventCard(month: "Jan", day: "15", title: "Chocolate Cake", location: "123 Baker Street", time: "18:00", onTap: {})
}

