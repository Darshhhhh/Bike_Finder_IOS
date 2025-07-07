//
//  NetworksListView.swift
//  Exam_Darsh_Shah
//
//  Created by Darsh on 2025-07-07.
//


import SwiftUI

struct CitiesListView: View {
    @State private var networks = [CityBikeNetwork]()
    @State private var searchText = ""
    private let controller = CitiesController()

    // Compute filtered results on the fly
    private var filteredNetworks: [CityBikeNetwork] {
        guard !searchText.isEmpty else { return networks }
        return networks.filter {
            $0.location.city
              .localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationView {
            List(filteredNetworks) { net in
                NavigationLink(destination: CityDetailView(network: net)) {
                    VStack(alignment: .leading) {
                        Text(net.location.city)
                            .font(.headline)
                        Text(net.location.country)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Bike Finder")
            .searchable(text: $searchText, prompt: "Search by City")
            .onAppear {
                controller.loadNetworks { loaded in
                    networks = loaded
                }
            }
        }
    }
}
