//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Vinicius Nadin on 07/12/22.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
