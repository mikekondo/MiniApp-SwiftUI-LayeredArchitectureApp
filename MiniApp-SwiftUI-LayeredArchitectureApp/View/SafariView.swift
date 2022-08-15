//
//  SafariView.swift
//  MiniApp-SwiftUI-LayeredArchitectureApp
//
//  Created by 近藤米功 on 2022/08/15.
//

import Foundation
import SafariServices
import SwiftUI

struct SafariView: UIViewControllerRepresentable{
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // 処置なし
    }

    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
}
