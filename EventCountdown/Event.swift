//
//  Event.swift
//  EventCountdown
//
//  Created by David Chea on 01/08/2025.
//

import SwiftUI
import SwiftData

@Model
class Event: Identifiable, Comparable, Hashable {
    
    // MARK: - Properties
    
    var id = UUID()
    
    var title: String
    var date: Date
    
    // MARK: - Initializers
    
    init(title: String, date: Date) {
        self.title = title
        self.date = date
    }
    
    // MARK: - Methods
    
    static func == (lhs: Event, rhs: Event) -> Bool {
        lhs.id == rhs.id
    }
    
    static func < (lhs: Event, rhs: Event) -> Bool {
        lhs.date < rhs.date
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
