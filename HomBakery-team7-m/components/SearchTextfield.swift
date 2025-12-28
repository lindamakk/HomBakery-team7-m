//
//  SearchTextfield.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//

import SwiftUI

struct SearchTextfield: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)

            TextField("Search", text: $text)
                .font(.system(size: 16))
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(14)
    }
}



#Preview {
    SearchTextfield(text: .constant(""))
    
}
