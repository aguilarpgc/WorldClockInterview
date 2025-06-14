//
//  WorldClockInterviewApp.swift
//  WorldClockInterview
//
//  Created by Paul Aguilar on 13/06/25.
//

import SwiftUI

@main
struct WorldClockInterviewApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: WorldClockViewModel())
        }
    }
}
