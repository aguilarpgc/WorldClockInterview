//
//  Continent.swift
//  WorldClockInterview
//
//  Created by Paul Aguilar on 13/06/25.
//

import Foundation

struct Continent: Identifiable, Codable {
    let id: UUID
    let name: String
    let locations: [Location]
    
    init(id: UUID = UUID(), name: String, locations: [Location]) {
        self.id = id
        self.name = name
        self.locations = locations
    }
}
