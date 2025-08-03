//
//  EventsView.swift
//  EventCountdown
//
//  Created by David Chea on 01/08/2025.
//

import SwiftUI

struct EventsView: View {
    
    // MARK: - Enums
    
    enum Destination: Hashable {
        case addEvent, editEvent(Event)
    }
    
    // MARK: - States
    
    @State private var events: [Event] = []
    @State private var path = NavigationPath()
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(events.sorted()) { event in
                    NavigationLink(value: Destination.editEvent(event)) {
                        EventRow(event: event)
                    }
                }
                .onDelete(perform: deleteEvents)
            }
            .toolbar {
                Button {
                    path.append(Destination.addEvent)
                } label: {
                    Image(systemName: "plus")
                }
            }
            .navigationTitle("Events")
            .navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .addEvent:
                    EventForm(events: $events, event: nil)
                case .editEvent(let event):
                    EventForm(events: $events, event: event)
                }
            }
        }
    }
    
    // MARK: - Methods
    
    private func deleteEvents(indexSet: IndexSet) {
        let sortedEvents = events.sorted()
        let eventsToDelete = indexSet.map { sortedEvents[$0] }
        
        events.removeAll { eventsToDelete.contains($0) }
    }
}
