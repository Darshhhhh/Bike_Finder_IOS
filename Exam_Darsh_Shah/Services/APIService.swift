//
//  APIService.swift
//  Exam_Darsh_Shah
//
//  Created by Darsh on 2025-07-07.
//


import Foundation

final class APIService {
    static let shared = APIService()

    func fetchNetworks(completion: @escaping (Result<[CityBikeNetwork], Error>) -> Void) {
        let url = URL(string: "https://api.citybik.es/v2/networks")!
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error)); return
            }
            guard let data = data else {
                completion(.failure(NSError())); return
            }
            do {
                let resp = try JSONDecoder().decode(NetworksResponse.self, from: data)
                completion(.success(resp.networks))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
