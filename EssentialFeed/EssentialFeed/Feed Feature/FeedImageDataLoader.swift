//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by Vinicius Nadin on 07/12/22.
//

import Foundation

public protocol FeedImageDataLoader {
    func loadImageData(from url: URL) throws -> Data
}
