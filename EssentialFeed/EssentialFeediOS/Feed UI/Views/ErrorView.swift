//
//  ErrorView.swift
//  EssentialFeediOS
//
//  Created by Vinicius Nadin on 26/12/22.
//

import UIKit

public final class ErrorView: UIView {
    
    private lazy var errorButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    public var message: String? {
        get { return errorButton.title(for: .normal) }
        set { errorButton.setTitle(newValue, for: .normal) }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        message = nil
        makeErrorButtonConstraints()
        self.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeErrorButtonConstraints() {
        self.addSubview(errorButton)
        NSLayoutConstraint.activate([
            errorButton.topAnchor.constraint(equalTo: self.topAnchor),
            errorButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            errorButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            errorButton.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
