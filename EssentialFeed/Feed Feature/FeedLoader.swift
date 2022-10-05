//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Vinicius Nadin on 05/10/22.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load(completion: @escaping(LoadFeedResult) -> Void)
}
