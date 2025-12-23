//
//  Item.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
