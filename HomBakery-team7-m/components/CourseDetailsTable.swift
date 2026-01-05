import SwiftUI

struct CourseDetailsTable: View {
    var chefName: String = "-"
    let level: Levels
    var duration: String = "-"
    var dateTime: String = "-"
    var location: String = "-"
    
    var body: some View {
        
        Grid(alignment: .leading, horizontalSpacing: 20, verticalSpacing: 12) {
            
            // Row 1: Chef (Spans across)
            GridRow {
                Text("Chef:").bold()
                Text(chefName)
                    .gridCellColumns(3) // Allows name to take up the rest of the row
            }
            
            // Row 2: Level and Duration
            GridRow {
                Text("Level:").bold()
                Level(levels: level)
                
                Text("Duration:").bold()
                Text(duration)
            }
            
            // Row 3: Date and Location
            GridRow {
                Text("Date & time:").bold()
                Text(dateTime)
                
                Text("Location:").bold()
                Text(location)
            }
        }
        .font(.system(size: 14))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
