//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Vinicius Nadin on 20/02/23.
//

import Foundation

public protocol FeedCache {
    func save(_ feed: [FeedImage]) throws
}
