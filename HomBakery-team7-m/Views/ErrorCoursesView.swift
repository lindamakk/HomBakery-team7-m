//
//  ErrorCoursesView.swift
//  HomBakery-team7-m
//
//  Created by dina alswailem on 16/07/1447 AH.
//

import SwiftUI

struct ErrorCoursesView: View {

    let retryAction: () -> Void

    var body: some View {
        Spacer()

        VStack(spacing: 12) {
            Text("Something went wrong")
                .font(.headline)

            Button("Retry") {
                retryAction()
            }
        }

        Spacer()
    }
}

#Preview {
    ErrorCoursesView {
        print("Retry tapped")
    }
}
