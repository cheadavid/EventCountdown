//
//  Event.swift
//  EventCountdown
//
//  Created by David Chea on 01/08/2025.
//

import SwiftUI

@Observable
class Event: Identifiable, Comparable, Hashable {
    
    // MARK: - Properties
    
    let id = UUID()
    
    var title: String
    var date: Date
    var textColor: Color
    
    // MARK: - Initializers
    
    init(title: String, date: Date, textColor: Color) {
        self.title = title
        self.date = date
        self.textColor = textColor
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
