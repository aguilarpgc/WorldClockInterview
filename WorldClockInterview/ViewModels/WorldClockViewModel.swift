//
//  WorldClockViewModel.swift
//  WorldClockInterview
//
//  Created by Paul Aguilar on 13/06/25.
//

import Foundation
import Combine

final class WorldClockViewModel: ObservableObject {
    @Published var continents: [ContinentViewModel] = []
    private var timerCancelable: AnyCancellable?

    private static let defaultData: [Continent] = [
        .init(name: "America", locations: [
            .init(name: "New York", timezone: "America/New_York"),
            .init(name: "Los Angeles", timezone: "America/Los_Angeles"),
            .init(name: "Chicago", timezone: "America/Chicago"),
            .init(name: "Buenos Aires", timezone: "America/Argentina/Buenos_Aires")
        ]),
        .init(name: "Europe", locations: [
            .init(name: "London", timezone: "Europe/London"),
            .init(name: "Paris", timezone: "Europe/Paris"),
            .init(name: "Berlin", timezone: "Europe/Berlin"),
            .init(name: "Rome", timezone: "Europe/Rome")
        ]),
        .init(name: "Asia", locations: [
            .init(name: "Tokyo", timezone: "Asia/Tokyo"),
            .init(name: "Seoul", timezone: "Asia/Seoul"),
            .init(name: "Beijing", timezone: "Asia/Beijing"),
            .init(name: "Shanghai", timezone: "Asia/Shanghai"),
            .init(name: "Osaka", timezone: "Asia/Osaka")]),
        .init(name: "Oceania", locations: [
            .init(name: "Sydney", timezone: "Australia/Sydney")
        ])
    ]

    init(data: [Continent] = WorldClockViewModel.defaultData) {
        self.continents = data.map { ContinentViewModel(continent: $0) }
        startTimer()
    }
    
    func startTimer() {
        timerCancelable = Timer.publish(every: 1, tolerance: 0.1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] date in
                self?.updateLocations(time: date)
            }
    }
    
    func updateLocations(time: Date) {
        self.continents.flatMap(\.locations)
            .forEach { $0.update(time: time) }
    }
    
}
