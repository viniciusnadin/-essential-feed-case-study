//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Vinicius Nadin on 03/11/22.
//

import XCTest
import EssentialFeed

class LocalFeedLoader {
    private let store: FeedStore
    
    init(store: FeedStore) {
        self.store = store
    }
    
    func save(_ items: [FeedItem]) {
        self.store.deleteCacheFeed()
    }
}

class FeedStore {
    var deleteCacheFeedCallCount = 0
    
    func deleteCacheFeed() {
        self.deleteCacheFeedCallCount += 1
    }
}

class CacheFeedUseCaseTests: XCTestCase {
    
    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)
        
        XCTAssertEqual(store.deleteCacheFeedCallCount, 0)
    }
    
    func test_save_requestsCacheDeletion() {
        let store = FeedStore()
        let sut = LocalFeedLoader(store: store)
        let items = [uniqueItem(), uniqueItem()]
        
        sut.save(items)
        XCTAssertEqual(store.deleteCacheFeedCallCount, 1)
    }
    
    // MARK: - Helpers
    private func uniqueItem() -> FeedItem {
        return FeedItem(id: UUID(), description: "", location: "", imageURL: anyURL())
    }
    
    private func anyURL() -> URL {
        return URL(string: "http://any-url.com")!
    }
}
