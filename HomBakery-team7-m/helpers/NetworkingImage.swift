//
//  NetworkingImage.swift
//  HomBakery-team7-m
//
//  Created by nouransalah on 09/07/1447 AH.
//
import Foundation
import SwiftUI

import SwiftUI

struct NetworkImage: View {
    let url: String

    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFill()
            } else if phase.error != nil {
                Image(systemName: "photo")
                    .foregroundColor(.gray)
            } else {
                ProgressView()
            }
        }
    }
}
