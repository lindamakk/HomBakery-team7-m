//
//  Button.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//

import SwiftUI

struct ButtonView: View {
    
    var label: String = "Sign in"
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(label)
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(red: 190/255, green: 90/255, blue: 50/255))
                .cornerRadius(10)
        }
        .padding(.top, 10)
    }
}
#Preview {
    ButtonView(action:{ })
}

