//
//  Music.swift
//  MiniApp-SwiftUI-LayeredArchitectureApp
//
//  Created by 近藤米功 on 2022/08/15.
//

import Foundation

struct SongDataItem: Identifiable{
    let id = UUID()
    let artistName: String
    let trackName: String
    let artworkUrl100: String
    let artistViewUrl: URL
}

struct Songs: Codable {
    let results: [Song]
}

struct Song: Codable {
    let artistName: String
    let trackName: String
    let artworkUrl100: String
    let artistViewUrl: URL
}
