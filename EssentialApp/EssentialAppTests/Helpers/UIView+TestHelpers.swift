//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Vinicius Nadin on 28/05/23.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
