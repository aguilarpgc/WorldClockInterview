//
//  LocationViewModel.swift
//  WorldClockInterview
//
//  Created by Paul Aguilar on 13/06/25.
//

import Foundation
import Combine

final class LocationViewModel: ObservableObject, Identifiable {
    let id: UUID
    let name: String
    private let timezone: TimeZone
    @Published private(set) var currentTimeString: String = ""
    
    
    init(location: Location) {
        self.id = location.id
        self.name = location.name
        self.timezone = TimeZone(identifier: location.timezone) ?? .current
        update(time: Date())
    }
    
    func update(time: Date) {
        currentTimeString = time.formatted(
            Date.FormatStyle(timeZone: timezone)
                .hour(.defaultDigits(amPM: .abbreviated))
                .minute(.twoDigits)
                .second(.twoDigits)
        )
    }
}
