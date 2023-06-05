//
//  FeedEndPoint.swift
//  EssentialFeed
//
//  Created by Vinicius Nadin on 05/06/23.
//

import Foundation

public enum FeedEndpoint {
    case get

    public func url(baseURL: URL) -> URL {
        switch self {
        case .get:
            return baseURL.appendingPathComponent("/v1/feed")
        }
    }
}
