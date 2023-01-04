//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Vinicius Nadin on 04/01/23.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>

    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
