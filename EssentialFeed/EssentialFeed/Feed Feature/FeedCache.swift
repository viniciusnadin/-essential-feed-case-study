//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Vinicius Nadin on 20/02/23.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>
    
    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
