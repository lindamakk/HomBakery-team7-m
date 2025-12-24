//
//  Textfield.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//

import SwiftUI

struct ProfileCard: View {
    
    @State var username: String = "Test" // will need to pass the real username
    @State var isEditing: Bool = false
    
    var body: some View {
        HStack {
            ZStack(alignment:.bottomTrailing){
                Image("Profile")
                    .frame(width: 46.16, height: 46.16)
                    .background(Color(hue: 0.1, saturation: 0.3, brightness: 0.8))
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.black))
                
                Image(systemName: "plus")
                    .font(.caption).padding(2)
                          .foregroundColor(.white)
                    .background(Color.accent)
                    .clipShape(Circle())
                    .frame( alignment: .bottomLeading)
                
            }
            
            TextField("Username", text: $username)
                .disabled(!isEditing)
            
            Button(action: {
                if isEditing {
                    sendUpdatedText(username)
                }
                isEditing.toggle()
            }) {
                Text(isEditing ? "Done" : "Edit")
                    .fontWeight(.bold)
            }
            .padding(.leading, 8)
            
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
    }
    

    func sendUpdatedText(_ newName: String) {
        print("Sending to server: \(newName)")
        // Replace with api method later
    }
}
