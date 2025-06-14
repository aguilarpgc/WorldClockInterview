//
//  ContinentViewModel.swift
//  WorldClockInterview
//
//  Created by Paul Aguilar on 13/06/25.
//

import Foundation

final class ContinentViewModel: Identifiable {
    let id: UUID
    let name: String
    let locations: [LocationViewModel]
    
    init(continent: Continent) {
        self.id = continent.id
        self.name = continent.name
        self.locations = continent.locations.map(LocationViewModel.init)
    }
}
