//
//  SplashView.swift
//  HomBakery-team7-m
//
//  Created by aisha alh on 05/07/1447 AH.
//


import SwiftUI

struct SplashView: View {

    var body: some View {
        VStack(spacing: 16) {

            Spacer()

            Image("splashLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 160)

            Text("Home Bakery")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(Color.brown)

            Text("Baked to Perfection")
                .font(.system(size: 16))
                .foregroundColor(Color.brown.opacity(0.7))

            Spacer()
        }
        .background(Color.white)
    }
}
