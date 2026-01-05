//
//  SuccessAlert.swift
//  HomBakery-team7-m
//
//  Created by Linda on 05/01/2026.
//

import SwiftUI

struct SuccessAlert: View {
    @Binding var show: Bool
    var text = "Successful"
    var body: some View {
        ZStack {
//
                    RoundedRectangle(cornerRadius:  8)
                        .foregroundColor(.white)
                        .frame(width: 156, height: 158)
                        .shadow(color: .black.opacity(0.01), radius: 20, x: 0.0,y: 0.0)
                        .shadow(color: .black.opacity(0.1), radius: 30, x: 0.0,y: 0.0)
                    VStack(spacing: 20){
                        Image(systemName: "checkmark.circle").font(.system(size: 64)).foregroundStyle(.accent)
                        Text(text).foregroundStyle(.accent).bold()
                    }
        }.ignoresSafeArea()
    }
}

