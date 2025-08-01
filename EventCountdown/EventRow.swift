//
//  EventRow.swift
//  EventCountdown
//
//  Created by David Chea on 01/08/2025.
//

import SwiftUI

struct EventRow: View {
    
    // MARK: - States
    
    @State private var relativeDate = ""
    
    // MARK: - Properties
    
    let event: Event
    let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    
    let formatter = {
        let f = RelativeDateTimeFormatter()
        f.unitsStyle = .full
        
        return f
    }()
    
    // MARK: - Body
    
    var body: some View {
        VStack() {
            Text(event.title)
                .foregroundColor(event.textColor)
                .font(.headline)
            Text(relativeDate)
                .foregroundColor(.gray)
                .font(.subheadline)
        }
        .onAppear(perform: updateDate)
        .onReceive(timer) { _ in
            updateDate()
        }
    }
    
    // MARK: - Methods
    
    private func updateDate() {
        relativeDate = formatter.localizedString(for: event.date, relativeTo: Date())
    }
}
