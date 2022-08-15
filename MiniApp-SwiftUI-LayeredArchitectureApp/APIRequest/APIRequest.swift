//
//  APIRequest.swift
//  MiniApp-SwiftUI-LayeredArchitectureApp
//
//  Created by 近藤米功 on 2022/08/15.
//

import Foundation

class APIRequest {
    func fetchSong(searchText: String) async throws -> Songs?{
        let url = URL(string: "https://itunes.apple.com/search?term=\(searchText)&entity=song&contry=jp")
        guard let url = url else {
            return nil
        }
        let request = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(Songs.self, from: data)
    }
}
