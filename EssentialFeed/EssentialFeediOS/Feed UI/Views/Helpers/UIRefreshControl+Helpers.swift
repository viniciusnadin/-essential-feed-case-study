//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Vinicius Nadin on 27/12/22.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
