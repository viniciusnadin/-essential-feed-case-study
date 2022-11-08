//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Vinicius Nadin on 05/10/22.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedImage])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping(LoadFeedResult) -> Void)
}
