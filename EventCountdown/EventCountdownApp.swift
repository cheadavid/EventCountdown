//
//  EventCountdownApp.swift
//  EventCountdown
//
//  Created by David Chea on 01/08/2025.
//

import SwiftUI

@main
struct EventCountdownApp: App {
    
    // MARK: - States
    
    @State private var events = Events(events: [])
    
    // MARK: - Body
    
    var body: some Scene {
        WindowGroup {
            EventsView()
                .environment(events)
        }
    }
}
