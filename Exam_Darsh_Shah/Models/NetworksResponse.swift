//
//  NetworksResponse.swift
//  Exam_Darsh_Shah
//
//  Created by Darsh on 2025-07-07.
//


import Foundation

struct NetworksResponse: Codable {
    let networks: [CityBikeNetwork]
}

struct CityBikeNetwork: Codable, Identifiable {
    let id:      String
    let name:    String
    let location: Location
    let company: [String]?
}

struct Location: Codable {
    let city:      String
    let country:   String
    let latitude:  Double
    let longitude: Double
}
