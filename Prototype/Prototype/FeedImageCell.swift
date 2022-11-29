//
//  FeedImageCell.swift
//  Prototype
//
//  Created by Vinicius Nadin on 27/11/22.
//

import UIKit

class FeedImageCell: UITableViewCell {
    
    static let reuseIdentifier = "FeedImageCell"
    
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
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1.0)
        label.font = label.font.withSize(15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var locationContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.spacing = 6
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var mainImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageContainer: UIView = {
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
    
    private lazy var mainLabel: UILabel = {
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
        
        self.mainImageView.alpha = 0
        self.imageContainer.startShimmering()
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.mainImageView.alpha = 0
        self.imageContainer.startShimmering()
    }
    
    private func fadeIn(_ image: UIImage?) {
        mainImageView.image = image

        UIView.animate(withDuration: 0.25, delay: 1.25, options: [], animations: {
            self.mainImageView.alpha = 1
        }) { completed in
            if completed {
                self.imageContainer.stopShimmering()
            }
        }
    }
    
    func configure(with model: FeedImageViewModel) {
        
        mainLabel.text = model.description
        mainLabel.isHidden = model.description == nil
        
        locationLabel.text = model.location
        locationContainer.isHidden = model.location == nil
        
        fadeIn(UIImage(named: model.imageName))
    }
    
    private func createLocationConstraints() {
        addSubview(mainContainer)
        mainContainer.addArrangedSubview(locationContainer)
        mainContainer.addArrangedSubview(imageContainer)
        mainContainer.addArrangedSubview(mainLabel)
        
        locationContainer.addArrangedSubview(locationImageViewContainer)
        locationContainer.addArrangedSubview(locationLabel)
        
        imageContainer.addSubview(mainImageView)
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
            
            imageContainer.widthAnchor.constraint(equalTo: mainContainer.widthAnchor),
            imageContainer.heightAnchor.constraint(equalTo: mainContainer.widthAnchor, multiplier: 1.0),
            
            mainImageView.topAnchor.constraint(equalTo: imageContainer.topAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: imageContainer.bottomAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor),
            
            locationContainer.widthAnchor.constraint(equalTo: mainContainer.widthAnchor),
            
            locationImageViewContainer.widthAnchor.constraint(equalToConstant: 10),
            
            locationBadgeImageView.topAnchor.constraint(equalTo: locationImageViewContainer.topAnchor, constant: 4),
            locationBadgeImageView.leadingAnchor.constraint(equalTo: locationImageViewContainer.leadingAnchor),
            locationBadgeImageView.heightAnchor.constraint(equalToConstant: 14)
        ])
        
    }
    
}

private extension UIView {
    private var shimmerAnimationKey: String {
        return "shimmer"
    }

    func startShimmering() {
        let white = UIColor.white.cgColor
        let alpha = UIColor.white.withAlphaComponent(0.7).cgColor
        let width = bounds.width
        let height = bounds.height

        let gradient = CAGradientLayer()
        gradient.colors = [alpha, white, alpha]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.4)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.6)
        gradient.locations = [0.4, 0.5, 0.6]
        gradient.frame = CGRect(x: -width, y: 0, width: width*3, height: height*2)
        layer.mask = gradient

        let animation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.locations))
        animation.fromValue = [0.0, 0.1, 0.2]
        animation.toValue = [0.8, 0.9, 1.0]
        animation.duration = 1
        animation.repeatCount = .infinity
        gradient.add(animation, forKey: shimmerAnimationKey)
    }

    func stopShimmering() {
        layer.mask = nil
    }
}
