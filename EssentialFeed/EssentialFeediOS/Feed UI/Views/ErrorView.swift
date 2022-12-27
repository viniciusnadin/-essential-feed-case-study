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
        button.addTarget(self, action: #selector(hideMessageAnimated), for: .touchUpInside)
        return button
    }()
    
    public var message: String? {
        get { return isVisible ? errorButton.title(for: .normal) : nil }
        set { setMessageAnimated(newValue) }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        message = nil
        makeErrorButtonConstraints()
        self.backgroundColor = .red
        alpha = 0
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
    
    private var isVisible: Bool {
        return alpha > 0
    }
    
    private func setMessageAnimated(_ message: String?) {
        if let message = message {
            showAnimated(message)
        } else {
            hideMessageAnimated()
        }
    }
    
    private func showAnimated(_ message: String) {
        errorButton.setTitle(message, for: .normal)
        
        UIView.animate(withDuration: 0.25) {
            self.alpha = 1
        }
    }
    
    @objc private func hideMessageAnimated() {
        UIView.animate(
            withDuration: 0.25,
            animations: { self.alpha = 0 },
            completion: { completed in
                if completed { self.errorButton.setTitle(nil, for: .normal) }
            })
    }
}
