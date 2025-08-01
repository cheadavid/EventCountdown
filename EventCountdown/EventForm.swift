//
//  EventForm.swift
//  EventCountdown
//
//  Created by David Chea on 01/08/2025.
//

import SwiftUI

struct EventForm: View {
    
    // MARK: - Environments
    
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Bindings
    
    @Binding var events: [Event]
    
    // MARK: - States
    
    @State private var title = ""
    @State private var date = Date()
    @State private var textColor = Color.red
    
    // MARK: - Properties
    
    let event: Event?
    
    // MARK: - Body
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
                DatePicker("Date", selection: $date)
                ColorPicker("Text Color", selection: $textColor)
            }
        }
        .navigationTitle(event == nil ? "Add Event" : "Edit .\(event?.title ?? "Event")")
        .toolbar {
            Button {
                saveEvent()
            } label: {
                Image(systemName: "checkmark")
            }
        }
        .onAppear {
            if let event = event {
                title = event.title
                date = event.date
                textColor = event.textColor
            }
        }
    }
    
    // MARK: - Methods
    
    private func saveEvent() {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        
        let event = Event(id: event?.id ?? UUID(), title: title, date: date, textColor: textColor)
        events.append(event)
        
        dismiss()
    }
}
