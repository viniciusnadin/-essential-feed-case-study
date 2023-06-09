//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Vinicius Nadin on 04/01/23.
//

import Foundation

public protocol FeedImageDataStore {
    func insert(_ data: Data, for url: URL) throws
    func retrieve(dataForURL url: URL) throws -> Data?
}
