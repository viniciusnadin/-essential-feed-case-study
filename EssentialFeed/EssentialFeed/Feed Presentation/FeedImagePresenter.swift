//
//  FeedImagePresenter.swift
//  EssentialFeed
//
//  Created by Vinicius Nadin on 27/12/22.
//

import Foundation

public final class FeedImagePresenter {
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(
            description: image.description,
            location: image.location)
    }
}
