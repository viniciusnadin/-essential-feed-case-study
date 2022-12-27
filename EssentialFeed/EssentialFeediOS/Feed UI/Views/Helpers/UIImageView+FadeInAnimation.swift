//
//  UIImageView+FadeInAnimation.swift
//  EssentialFeediOS
//
//  Created by Vinicius Nadin on 16/12/22.
//

import UIKit

extension UIImageView {
    func fadeIn(_ newImage: UIImage?) {
        image = newImage
        
        guard newImage != nil else { return }
        alpha = 0
        
        UIView.animate(withDuration: 0.25, delay: 1.25, options: [], animations: {
            self.alpha = 1
        })
    }
}
