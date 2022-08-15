//
//  MusicListRepository.swift
//  MiniApp-SwiftUI-LayeredArchitectureApp
//
//  Created by 近藤米功 on 2022/08/15.
//

import Foundation

class SongListRepository{
    private let apiRequest = APIRequest()
    private var songsItem: [SongDataItem] = []

    func fetch(searchText: String) async throws -> [SongDataItem]?{
        let songList = try await apiRequest.fetchSong(searchText: searchText)
        guard let songList = songList else {
            return nil
        }
        songsItem = []
        songList.results.forEach { song in
            songsItem.append(SongDataItem(artistName: song.artistName, trackName: song.trackName, artworkUrl100: song.artworkUrl100, artistViewUrl: song.artistViewUrl))
        }
        return songsItem
    }
}
