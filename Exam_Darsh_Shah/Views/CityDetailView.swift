//
//  CityDetailView.swift
//  Exam_Darsh_Shah
//
//  Created by Darsh on 2025-07-07.
//


import SwiftUI
import MapKit

struct CityDetailView: View {
    let network: CityBikeNetwork
    @State private var isFav = false
    @State private var alertMsg = ""
    @State private var showAlert = false
    @State private var showConfirmRemove = false

    private let favCtrl = FavoritesController()

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("City: \(network.location.city)")
                Text("Country: \(network.location.country)")
                Text("Company: \(network.company?.joined(separator: ", ") ?? "N/A")")

                MapView(
                    coordinate: CLLocationCoordinate2D(
                        latitude: network.location.latitude,
                        longitude: network.location.longitude),
                    title: network.location.city
                )
                .frame(height: 200)

                Button(isFav ? "Remove Favorite" : "Mark Favorite") {
                    if isFav {
                        showConfirmRemove = true
                    } else {
                        isFav = favCtrl.add(network)
                        alertMsg = isFav ? "Added to favorites" : "Already a favorite"
                        showAlert = true
                    }
                }
                // Confirmation dialog for removal
                .confirmationDialog(
                    "Are you sure you want to remove this from your favorites?",
                    isPresented: $showConfirmRemove,
                    titleVisibility: .visible
                ) {
                    Button("Remove", role: .destructive) {
                        favCtrl.remove(network.id)
                        isFav = false
                        alertMsg = "Removed from favorites"
                        showAlert = true
                    }
                    Button("Cancel", role: .cancel) {}
                }
                // alert after add/remove
                .alert(alertMsg, isPresented: $showAlert) {
                    Button("OK", role: .cancel) {}
                }
            }
            .padding()
            .onAppear {
                isFav = favCtrl.isFav(network.id)
            }
        }
        .navigationTitle(network.location.city)
    }
}

