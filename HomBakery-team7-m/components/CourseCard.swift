//
//  Untitled.swift
//  HomBakery-team7-m
//
//  Created by Linda on 23/12/2025.
//
import SwiftUI
struct CourseCard: View {
    let course: CourseCardModel
    var body: some View {
        HStack(alignment: .top){
            //p1
            VStack{
                Image(course.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 94.1, height: 85.34)
                    .cornerRadius(4.5)
                
            }
            
            
            //p2
            VStack(alignment:.leading){
                Text(course.title)
                    .font(.system(size: 16, weight: .semibold));
                Text("course.description")
                
                //
                HStack(alignment:.center , spacing:4 ){
                    VStack(alignment: .center, spacing:4){
                        Image(systemName: "hourglass")

                        .font(.system(size: 15))
                            .foregroundColor(Color("brown"))
                        
                        Image(systemName: "calendar")
                        .font(.system(size: 15))
                            .foregroundColor(Color("brown"))

                        
                    }
                    VStack( alignment: .leading,spacing:4){

                        Text(course.duration)
                            .font(.system(size: 12, weight: .medium));
                        Text(course.startDate)
                            .font(.system(size: 11, weight: .medium));
                    }
                }
            }
            
        }//h
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)          // card color
                .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 0.5 )

        )
       
    }//bod
        
}

#Preview {
    
    CourseCard(course: CourseCardModel(
        id: 1,
        title: "SwiftUI Basics",
        description: "Learn the fundamentals",
        duration: "2h 30m",
        startDate: "24 Dec 2025",
        imageName: "fortest"
    ))
    
    
        .padding(.horizontal, 16)
}


struct CourseCardModel: Identifiable, Codable {
    let id: Int               // unique identifier
    let title: String          // course title
    let description: String   // subtitle / another component
    let duration: String      // e.g., "2 hours"
    let startDate: String     // e.g., "24 Dec 2025"
    let imageName: String     // local asset or URL
}
