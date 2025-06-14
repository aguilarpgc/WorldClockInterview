//
//  ContentView.swift
//  WorldClockInterview
//
//  Created by Paul Aguilar on 13/06/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: WorldClockViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.continents) { continent in
                    Section(continent.name) {
                        ForEach(continent.locations) { locationVM in
                            CityRowView(viewModel: locationVM)
                        }
                    }}
            }
            .listStyle(.insetGrouped)
            .navigationTitle("World Clock")
        }
    }
}

#Preview {
    ContentView(viewModel: WorldClockViewModel())
}
