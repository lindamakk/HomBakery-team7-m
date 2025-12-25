//
//  Level.swift
//  HomBakery-team7-m
//
//  Created by nouransalah on 04/07/1447 AH.
//
import SwiftUI
//enum reteurn title color of title and color of background
enum Levels :String, Codable {
    case Beginner
    case Intermediate
    case Advanced
    
    //title
        var title: String {
            rawValue.capitalized
        }
    
    //background color
    var backColor: Color {
        switch self {
        case .Beginner:
            return Color("brownColor")
        case .Intermediate:
            return Color("creamColor")
        case .Advanced:
            return Color("AccentColor")
        }
    }
    //text color
    var textColor: Color {
        switch self {
        case .Beginner:
            return Color.white
        case .Intermediate:
            return Color("brownColor")
        case .Advanced:
            return Color.white
        }
    }

}//end of enum

struct Level: View {
    let levels: Levels
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 37)
                .frame(width: 54.37, height: 14.22)
                .foregroundColor(levels.backColor)
            Text(levels.title)
                .foregroundColor(levels.textColor)
                .font(.system(size: 10, weight: .medium));
        }
        
    }
}

#Preview {
    Level(levels: .Beginner)

}
