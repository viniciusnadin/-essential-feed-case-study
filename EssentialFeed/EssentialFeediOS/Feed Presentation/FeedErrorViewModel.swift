//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//
//  Created by Vinicius Nadin on 27/12/22.
//

struct FeedErrorViewModel {
    let message: String?
    
    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }
    
    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
