//
//  FeedImageCell.swift
//  EssentialFeediOS
//
//  Created by Vinicius Nadin on 03/12/22.
//

import UIKit

public final class FeedImageCell: UITableViewCell {
    
    private let feedAccessibilityIdentifier: String = "feed-image-cell"
    private let feedImageAccessibilityIdentifier: String = "feed-image-view"
    
    private(set) public lazy var feedImageRetryButton: UIButton = {
        let button = UIButton()
        button.setTitle("↻", for: .normal)
        button.titleLabel?.font = button.titleLabel?.font.withSize(60)
        button.addTarget(self, action: #selector(retryButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var onRetry: (() -> Void)?
    
    @objc private func retryButtonTapped() {
        onRetry?()
    }
    
    private lazy var locationImageViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var locationBadgeImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "pin")
        return view
    }()
    
    public lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1.0)
        label.font = label.font.withSize(15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public lazy var locationContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.spacing = 6
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    public lazy var feedImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.accessibilityIdentifier = feedImageAccessibilityIdentifier
        return view
    }()
    
    public lazy var feedImageContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 227/255, green: 227/255, blue: 227/255, alpha: 1.0)
        view.layer.cornerRadius = 22
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var mainContainer: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.spacing = 10
        view.axis = .vertical
        return view
    }()
    
    public lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 6
        label.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(16)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createLocationConstraints()
        selectionStyle = .none
        layoutIfNeeded()
        
        self.feedImageView.alpha = 0
        self.feedImageContainer.isShimmering = true
        self.accessibilityIdentifier = feedImageAccessibilityIdentifier
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
        
        self.feedImageView.alpha = 0
        self.feedImageContainer.isShimmering = true
    }
    
    private func createLocationConstraints() {
        addSubview(mainContainer)
        mainContainer.addArrangedSubview(locationContainer)
        mainContainer.addArrangedSubview(feedImageContainer)
        mainContainer.addArrangedSubview(descriptionLabel)
        
        locationContainer.addArrangedSubview(locationImageViewContainer)
        locationContainer.addArrangedSubview(locationLabel)
        
        feedImageContainer.addSubview(feedImageView)
        feedImageContainer.addSubview(feedImageRetryButton)
        locationImageViewContainer.addSubview(locationBadgeImageView)
        
        let topConstraint = mainContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 6)
        let bottomConstraint = mainContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6)
        
        topConstraint.priority = UILayoutPriority(999)
        bottomConstraint.priority = UILayoutPriority(999)
        
        NSLayoutConstraint.activate([
            topConstraint,
            mainContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            bottomConstraint,
            mainContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            
            feedImageContainer.widthAnchor.constraint(equalTo: mainContainer.widthAnchor),
            feedImageContainer.heightAnchor.constraint(equalTo: mainContainer.widthAnchor, multiplier: 1.0),
            
            feedImageView.topAnchor.constraint(equalTo: feedImageContainer.topAnchor),
            feedImageView.leadingAnchor.constraint(equalTo: feedImageContainer.leadingAnchor),
            feedImageView.bottomAnchor.constraint(equalTo: feedImageContainer.bottomAnchor),
            feedImageView.trailingAnchor.constraint(equalTo: feedImageContainer.trailingAnchor),
            
            feedImageRetryButton.topAnchor.constraint(equalTo: feedImageContainer.topAnchor),
            feedImageRetryButton.leadingAnchor.constraint(equalTo: feedImageContainer.leadingAnchor),
            feedImageRetryButton.bottomAnchor.constraint(equalTo: feedImageContainer.bottomAnchor),
            feedImageRetryButton.trailingAnchor.constraint(equalTo: feedImageContainer.trailingAnchor),
            
            locationContainer.widthAnchor.constraint(equalTo: mainContainer.widthAnchor),
            
            locationImageViewContainer.widthAnchor.constraint(equalToConstant: 10),
            
            locationBadgeImageView.topAnchor.constraint(equalTo: locationImageViewContainer.topAnchor, constant: 4),
            locationBadgeImageView.leadingAnchor.constraint(equalTo: locationImageViewContainer.leadingAnchor),
            locationBadgeImageView.heightAnchor.constraint(equalToConstant: 14)
        ])
        
    }
}
