//
//  NetworksController.swift
//  Exam_Darsh_Shah
//
//  Created by Darsh on 2025-07-07.
//


import Foundation

final class CitiesController {
    func loadNetworks(_ completion: @escaping ([CityBikeNetwork]) -> Void) {
        APIService.shared.fetchNetworks { result in
            switch result {
            case .success(let nets): completion(nets)
            case .failure:           completion([]) 
            }
        }
    }
}
