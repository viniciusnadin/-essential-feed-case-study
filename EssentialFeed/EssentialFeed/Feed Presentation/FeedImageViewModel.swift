//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Vinicius Nadin on 27/12/22.
//

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?
    
    public var hasLocation: Bool {
        return location != nil
    }
}
