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
            }
            .navigationTitle("Events")
            .toolbar {
                Button {
                    path.append(Destination.addEvent)
                } label: {
                    Image(systemName: "plus")
                }
            }
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
}
