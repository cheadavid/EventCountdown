//
//  Event.swift
//  EventCountdown
//
//  Created by David Chea on 01/08/2025.
//

import SwiftUI

struct Event: Identifiable, Comparable, Hashable {
    
    // MARK: - Properties
    
    let id: UUID
    
    var title: String
    var date: Date
    var textColor: Color
    
    // MARK: - Methods
    
    static func < (lhs: Event, rhs: Event) -> Bool {
        lhs.date < rhs.date
    }
}
