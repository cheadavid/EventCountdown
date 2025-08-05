//
//  EventForm.swift
//  EventCountdown
//
//  Created by David Chea on 01/08/2025.
//

import SwiftUI
import SwiftData

struct EventForm: View {
    
    // MARK: - Environments
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    // MARK: - Queries
    
    @Query var events: [Event]
    
    // MARK: - States
    
    @State private var event: Event
    
    // MARK: - Initializers
    
    init(event: Event?) {
        if let event = event {
            _event = State(initialValue: event)
        } else {
            _event = State(initialValue: Event(title: "", date: Date()))
        }
    }
    
    // MARK: - Body
    
    var body: some View {
        Form {
            TextField("Title", text: $event.title)
            DatePicker("Date", selection: $event.date)
        }
        .navigationTitle(events.contains(event) ? "Edit \(event.title)" : "Add Event")
        .toolbar {
            Button {
                saveEvent()
            } label: {
                Image(systemName: "checkmark")
            }
        }
    }
    
    // MARK: - Methods
    
    private func saveEvent() {
        guard !event.title.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        
        if !events.contains(event) {
            context.insert(event)
        }
        
        dismiss()
    }
}
