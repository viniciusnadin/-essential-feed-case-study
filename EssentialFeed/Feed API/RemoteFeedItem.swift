//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Vinicius Nadin on 08/11/22.
//

import Foundation

 struct RemoteFeedItem: Decodable {
     let id: UUID
     let description: String?
     let location: String?
     let image: URL
}

