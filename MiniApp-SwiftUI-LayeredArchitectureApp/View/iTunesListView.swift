//
//  ContentView.swift
//  MiniApp-SwiftUI-LayeredArchitectureApp
//
//  Created by 近藤米功 on 2022/08/15.
//

import SwiftUI
import SDWebImageSwiftUI

struct iTunesListView: View {
    @ObservedObject var songListFeature = SongListFeature()
    @State var searchText = ""
    @State var showSafari = false

    var body: some View {
        VStack{
            TextField("アーティスト名、曲名", text: $searchText,onCommit: {
                fetchSong()
            })
            .padding()
            
            List{
                if let songItem = songListFeature.songsItem {
                    ForEach(songItem) { song in

                        Button(action: {
                            showSafari.toggle()
                        }){
                        HStack{
                            WebImage(url: URL(string: song.artworkUrl100))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 60)
                            VStack{
                                Text(song.trackName)
                                    .padding()
                                Text(song.artistName)
                            }
                        }// HStackここまで
                    }// Buttonここまで
                        .sheet(isPresented: self.$showSafari, content: {
                            // SafariViewを表示する
                            SafariView(url: song.artistViewUrl)
                            // 画面下部をいっぱいになるようにセーフエリア外までいっぱいになるように指定
                                .edgesIgnoringSafeArea(.bottom)
                        })// sheetここまで
                }// ForEachここまで
            }// Listここまで
        }// VStackここまで
    }
    }

    private func fetchSong(){
        Task{
            do{
                try await songListFeature.fetch(searchText: searchText)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        iTunesListView()
    }
}
