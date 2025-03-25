//
//  CalenderView.swift
//  Kaisen
//
//  Created by Davaughn Williams on 3/25/25.
//

import SwiftUI
import EventKit

struct CalendarTaskTrackerView: View {
    @State private var selectedDate: Date = Date()
    @State private var tasks: [Date: String] = [:]
    @State private var newTask: String = ""
    
    var body: some View {
        VStack {
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
            
            Text("Tasks for: \(formattedDate(selectedDate))")
                .font(.headline)
                .padding()
            
            TextField("Enter Task", text: $newTask)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Save Task") {
                tasks[selectedDate] = newTask
                newTask = ""
            }
            .padding()
            .buttonStyle(.borderedProminent)
            
            List {
                ForEach(tasks.keys.sorted(), id: \..self) { date in
                    VStack(alignment: .leading) {
                        Text(formattedDate(date)).bold()
                        Text(tasks[date] ?? "")
                    }
                }
            }
        }
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}
#Preview {
    CalendarTaskTrackerView()
}
