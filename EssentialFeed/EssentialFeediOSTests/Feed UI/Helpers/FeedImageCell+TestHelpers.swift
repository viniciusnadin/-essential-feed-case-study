//
//  FeedImageCell+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Vinicius Nadin on 07/12/22.
//

import Foundation
import EssentialFeediOS

extension FeedImageCell {
    
    func simulateRetryAction() {
        feedImageRetryButton.simulateTap()
    }
    
    var descriptionText: String? {
        descriptionLabel.text
    }
    
    var locationText: String? {
        locationLabel.text
    }
    
    var isShowingLocation: Bool {
        !locationContainer.isHidden
    }
    
    var isShowingImageLoadingIndicator: Bool {
        return feedImageContainer.isShimmering
    }
    
    var renderedImage: Data? {
        return feedImageView.image?.pngData()
    }
    
    var isShowingRetryAction: Bool {
        return !feedImageRetryButton.isHidden
    }
}
