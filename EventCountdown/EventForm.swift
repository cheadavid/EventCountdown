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
    
    @State private var event: Event
    
    // MARK: - Initializers
    
    init(events: Binding<[Event]>, event: Event?) {
        _events = events
        
        if let event = event {
            _event = State(initialValue: event)
        } else {
            _event = State(initialValue: Event(title: "", date: Date(), textColor: .red))
        }
    }
    
    // MARK: - Body
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $event.title)
                DatePicker("Date", selection: $event.date)
                ColorPicker("Text Color", selection: $event.textColor)
            }
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
            events.append(event)
        }
        
        dismiss()
    }
}
