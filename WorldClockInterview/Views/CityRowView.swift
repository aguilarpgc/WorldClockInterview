//
//  CityRowView.swift
//  WorldClockInterview
//
//  Created by Paul Aguilar on 14/06/25.
//

import SwiftUI

struct CityRowView: View {
    @ObservedObject var viewModel: LocationViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.name)
                    .font(.headline)
                Text(viewModel.currentTimeString)
                    .font(.subheadline)
                    .monospacedDigit()
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    CityRowView(viewModel: LocationViewModel(location: Location(name: "London", timezone: "Europe/London")))
}
