//
//  UITableView+Dequeueing.swift
//  EssentialFeediOS
//
//  Created by Vinicius Nadin on 16/12/22.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}

