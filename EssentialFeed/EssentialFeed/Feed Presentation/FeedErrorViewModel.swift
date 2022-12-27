//
//  FeedErrorViewModel.swift
//  EssentialFeed
//
//  Created by Vinicius Nadin on 27/12/22.
//

public struct FeedErrorViewModel {
    public let message: String?
    
    public static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    public static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
