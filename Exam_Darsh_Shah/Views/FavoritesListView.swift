//
//  FavoritesListView.swift
//  Exam_Darsh_Shah
//
//  Created by Darsh on 2025-07-07.
//


import SwiftUI

struct FavoritesListView: View {
    @State private var favorites = [FavoriteLocation]()
    private let favCtrl = FavoritesController()

    var body: some View {
        NavigationView {
            Group {
                if favorites.isEmpty {
                    Text("No favorite bikes")
                        .foregroundColor(.secondary)
                        .italic()
                } else {
                    List {
                        ForEach(favorites) { fav in
                            NavigationLink(
                                destination: CityDetailView(
                                    network: CityBikeNetwork(favorite: fav)
                                )
                            ) {
                                VStack(alignment: .leading) {
                                    Text(fav.city ?? "")
                                        .font(.headline)
                                    Text(fav.company ?? "")
                                        .foregroundColor(.secondary)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        .onDelete(perform: delete)
                    }
                }
            }
            .navigationTitle("Favorites")
            .onAppear {
                favorites = favCtrl.allFavorites()
                let all = favCtrl.allFavorites()
                  print("🔍 Favorites in Core Data:")
                  all.forEach { print(" • \($0.city ?? "") (\($0.country ?? "")) – id:\($0.id ?? "")") }
                  favorites = all
            }
        }
    }

    private func delete(at offsets: IndexSet) {
        offsets.forEach { idx in
            if let id = favorites[idx].id {
                favCtrl.remove(id)
            }
        }
        favorites = favCtrl.allFavorites()
    }
}

