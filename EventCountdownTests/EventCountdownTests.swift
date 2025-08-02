//
//  EventCountdownTests.swift
//  EventCountdownTests
//
//  Created by David Chea on 01/08/2025.
//

import SwiftUI
import Testing

@testable import EventCountdown

struct EventCountdownTests {
    
    @Test func eventSortingByDate() {
        let today = Date()
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today)!
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today)!
        
        let event1 = Event(id: UUID(), title: "Tomorrow", date: tomorrow, textColor: .red)
        let event2 = Event(id: UUID(), title: "Yesterday", date: yesterday, textColor: .blue)
        let event3 = Event(id: UUID(), title: "Today", date: today, textColor: .green)
        
        let events = [event1, event2, event3].sorted()
        
        #expect(events[0].title == "Yesterday")
        #expect(events[1].title == "Today")
        #expect(events[2].title == "Tomorrow")
    }
}
