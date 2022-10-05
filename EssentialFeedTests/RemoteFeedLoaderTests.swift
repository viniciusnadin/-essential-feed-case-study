//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Vinicius Nadin on 05/10/22.
//

import XCTest

class HTTPClient {
    static var shared = HTTPClient()
    
    func get(from url: URL) {}
}

class HTTPClientSpy: HTTPClient {
    var requestedURL: URL?
    
    override func get(from url: URL) {
        self.requestedURL = url
    }
}

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.get(from: URL(string: "https://a-given-url.com")!)
    }
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        _ = RemoteFeedLoader()
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_loadRequestDataFromURL() {
        let sut = RemoteFeedLoader()
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
