//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Vinicius Nadin on 05/10/22.
//

import Foundation

public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
