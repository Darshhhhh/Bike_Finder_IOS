//
//  CityBikeNewtwork.swift
//  Exam_Darsh_Shah
//
//  Created by Darsh on 2025-07-07.
//

import Foundation

extension CityBikeNetwork {
    // Create a “fake” data from a saved FavoriteLocation
    init(favorite: FavoriteLocation) {
        self.id   = favorite.id ?? UUID().uuidString
        self.name = favorite.city ?? ""
        self.location = Location(
            city:      favorite.city      ?? "",
            country:   favorite.country   ?? "",
            latitude:  favorite.latitude,
            longitude: favorite.longitude
        )
        // split your comma-joined company string back into an array
        if let comp = favorite.company {
            self.company = comp.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) }
        } else {
            self.company = nil
        }
    }
}
