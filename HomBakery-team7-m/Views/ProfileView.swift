//
//  Untitled.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//

import SwiftUI
import SwiftData

struct ProfileView: View {

    
    var body: some View {
        ZStack {
            Color("AppBackground")
                            .ignoresSafeArea()
            
            
            SignInButtonView(action: {}).padding()
        }
        
    }}

#Preview {
    ProfileView()
}
