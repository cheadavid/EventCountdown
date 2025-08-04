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
    
    // MARK: - Environments
    
    @Environment(Events.self) private var events
    
    // MARK: - States
    
    @State private var path = NavigationPath()
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack(path: $path) {
            List(events.events) { event in
                NavigationLink(value: Destination.editEvent(event)) {
                    EventRow(event: event)
                        .swipeActions {
                            Button {
                                events.remove(event.id)
                            } label: {
                                Image(systemName: "trash")
                            }
                            .tint(.red)
                        }
                }
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
                    EventForm(event: nil)
                        .environment(events)
                case .editEvent(let event):
                    EventForm(event: event)
                        .environment(events)
                }
            }
        }
    }
}
