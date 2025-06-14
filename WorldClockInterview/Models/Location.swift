//
//  Location.swift
//  WorldClockInterview
//
//  Created by Paul Aguilar on 13/06/25.
//

import Foundation

struct Location: Identifiable, Codable {
    let id: UUID
    let name: String
    let timezone: String
    
    init(id: UUID = UUID(), name: String, timezone: String) {
        self.id = id
        self.name = name
        self.timezone = timezone
    }
}
