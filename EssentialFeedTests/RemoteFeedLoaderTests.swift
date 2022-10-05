//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Vinicius Nadin on 05/10/22.
//

import XCTest

class HTTPClient {
    var requestedURL: URL?
}

class RemoteFeedLoader {
    
}

class RemoteFeedLoaderTests: XCTestCase {
    
    func test_init_doesNotRequestDataFromURL() {
        _ = RemoteFeedLoader()
        let client = HTTPClient()
        
        XCTAssertNil(client.requestedURL)
    }
}
