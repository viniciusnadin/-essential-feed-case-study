//
//  FeedLoaderStub.swift
//  EssentialAppTests
//
//  Created by Vinicius Nadin on 20/02/23.
//

import EssentialFeed

class FeedLoaderStub: FeedLoader {
    private let result: FeedLoader.Result
    
    init(result: FeedLoader.Result) {
        self.result = result
    }
    
    func load(completion: @escaping (FeedLoader.Result) -> Void) {
        completion(result)
    }
}
