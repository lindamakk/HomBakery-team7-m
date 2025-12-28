

import SwiftUI


struct CourseDetailsTable: View {
    
    var chefName: String = "-"
    var level: String = "-"
    var duration: String = "-"
    var dateTime: String = "-"
    var location: String = "-"
    var body: some View {
        Grid(verticalSpacing: 10) {
            
            GridRow {
                HStack {
                    Text("Chef:").bold()
                    Text(chefName)
                    Spacer()
                }
                .gridCellColumns(3)
            }
            
            
            GridRow {
                HStack {
                    Text("Level:").bold()
                    Text(level)
                }
                .gridColumnAlignment(.leading)
                
                Spacer()
                
                HStack {
                    Text("Duration:").bold()
                    Text(duration)
                }
            }
            
         
            GridRow {
                HStack {
                    Text("Date & time:").bold()
                    Text(dateTime)
                }
                
                Spacer()
                
                HStack {
                    Text("Location:").bold()
                    Text(location)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}


#Preview {
    CourseDetailsTable()
}
