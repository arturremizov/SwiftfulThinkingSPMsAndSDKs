//
//  ImagePrefetcher.swift
//  SwiftfulThinkingSPMsAndSDKs
//
//  Created by Artur Remizov on 12.05.24.
//

import SDWebImage

final class ImagePrefetcher {
    private let prefetcher: SDWebImagePrefetcher
    init(prefetcher: SDWebImagePrefetcher = .init()) {
        self.prefetcher = prefetcher
    }
    
    func startPrefetching(urls: [URL]) {
        prefetcher.prefetchURLs(urls)
    }
    
    func stopPrefetching() {
        prefetcher.cancelPrefetching()
    }
}

import Kingfisher
final class ImagePrefetcher2 {
    private var prefetchers: [[URL] : Kingfisher.ImagePrefetcher] = [:]
    
    func startPrefetching(urls: [URL]) {
        prefetchers[urls] = Kingfisher.ImagePrefetcher(urls: urls)
        prefetchers[urls]?.start()
    }
    
    func stopPrefetching(urls: [URL]) {
        prefetchers[urls]?.stop()
    }
}
