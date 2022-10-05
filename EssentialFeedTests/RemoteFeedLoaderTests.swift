//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Vinicius Nadin on 05/10/22.
//

import XCTest

protocol HTTPClient {
    func get(from url: URL)
}

class RemoteFeedLoader {
    private let client: HTTPClient
    private let url: URL
    
    init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }
    
    func load() {
        self.client.get(from: self.url)
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        let (_, client) = self.makeSUT()
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_loadRequestDataFromURL() {
        let url = URL(string: "https://a-give-url.com")!
        let (sut, client) = self.makeSUT(url: url)
        
        sut.load()
        
        XCTAssertEqual(client.requestedURL, url)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(url: URL = URL(string: "https://a-url.com")!) -> (sut: RemoteFeedLoader, client: HTTPClientSpy) {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoader(url: url, client: client)
        return (sut, client)
    }
    
    private class HTTPClientSpy: HTTPClient {
        var requestedURL: URL?
        
        func get(from url: URL) {
            self.requestedURL = url
        }
    }
}
