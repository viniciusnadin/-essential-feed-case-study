//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by Vinicius Nadin on 12/12/22.
//

import UIKit
import EssentialFeed
import EssentialFeediOS

public final class FeedUIComposer {
    private init() {}
    
    public static func feedComposedWith(feedLoader: FeedLoader, imageLoader: FeedImageDataLoader) -> FeedViewController {
        let presentationAdapter = FeedLoaderPresentationAdapter(feedLoader: MainQueueDispatchDecorator(decoratee: feedLoader))
        
        let feedController = makeFeedViewController(delegate: presentationAdapter, errorView: ErrorView(), title: FeedPresenter.title)
        
        presentationAdapter.presenter = FeedPresenter(
            feedView: FeedViewAdapter(
                controller: feedController,
                imageLoader: MainQueueDispatchDecorator(decoratee: imageLoader)),
            loadingView: WeakRefVirtualProxy(feedController),
            errorView: WeakRefVirtualProxy(feedController))
        
        return feedController
    }
    
    private static func makeFeedViewController(delegate: FeedViewControllerDelegate, errorView: ErrorView, title: String) -> FeedViewController {
        let feedController = FeedViewController()
        feedController.delegate = delegate
        feedController.errorView = errorView
        feedController.title = title
        return feedController
    }
}
