//
//  MusicListFeature.swift
//  MiniApp-SwiftUI-LayeredArchitectureApp
//
//  Created by 近藤米功 on 2022/08/15.
//

import Foundation

class SongListFeature: ObservableObject {
    @Published var songsItem: [SongDataItem]?
    let songListRepository = SongListRepository()

    func fetch(searchText: String) async throws {
        songsItem = try await songListRepository.fetch(searchText: searchText)
    }

}
