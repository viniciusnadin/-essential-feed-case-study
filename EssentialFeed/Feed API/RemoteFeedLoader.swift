//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Vinicius Nadin on 06/10/22.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL)
}

public class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient
    
    public init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    public func load() {
        self.client.get(from: self.url)
    }
}
