//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Vinicius Nadin on 10/11/22.
//

import Foundation

func anyURL() -> URL {
    return URL(string: "http://any-url.com")!
}

func anyNSError() -> NSError {
    NSError(domain: "any error", code: 0)
}

func anyData() -> Data {
    return Data("any data".utf8)
}
