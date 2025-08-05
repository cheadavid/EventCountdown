//
//  EventsView.swift
//  EventCountdown
//
//  Created by David Chea on 01/08/2025.
//

import SwiftUI
import SwiftData

struct EventsView: View {
    
    // MARK: - Enums
    
    enum Destination: Hashable {
        case addEvent, editEvent(Event)
    }
    
    // MARK: - Environments
    
    @Environment(\.modelContext) private var context
    
    // MARK: - Queries
    
    @Query var events: [Event]
    
    // MARK: - States
    
    @State private var path = NavigationPath()
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack(path: $path) {
            List(events) { event in
                NavigationLink(value: Destination.editEvent(event)) {
                    EventRow(event: event)
                        .swipeActions {
                            Button {
                                context.delete(event)
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
                        .modelContainer(for: Event.self)
                case .editEvent(let event):
                    EventForm(event: event)
                        .modelContainer(for: Event.self)
                }
            }
        }
    }
}
