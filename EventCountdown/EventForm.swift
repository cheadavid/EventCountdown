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
    @Environment(\.modelContext) private var context
    
    // MARK: - States
    
    @State private var event: Event
    
    // MARK: - Properties
    
    private let isEditing: Bool
    
    // MARK: - Initializers
    
    init(event: Event?) {
        if let event = event {
            _event = State(initialValue: event)
            isEditing = true
        } else {
            _event = State(initialValue: Event(title: "", date: Date()))
            isEditing = false
        }
    }
    
    // MARK: - Body
    
    var body: some View {
        Form {
            TextField("Title", text: $event.title)
            DatePicker("Date", selection: $event.date)
        }
        .navigationTitle(isEditing ? "Edit \(event.title)" : "Add Event")
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
        
        if !isEditing {
            context.insert(event)
        }
        
        dismiss()
    }
}
