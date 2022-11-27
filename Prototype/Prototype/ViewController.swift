//
//  ViewController.swift
//  Prototype
//
//  Created by Vinicius Nadin on 27/11/22.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.separatorStyle = .none
        self.registerPrototypeCell()
    }
    
    private func registerPrototypeCell() {
        tableView.register(PrototypeCell.self, forCellReuseIdentifier: "PrototypeCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "PrototypeCell")!
    }
}

class PrototypeCell: UITableViewCell {
    
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
        label.text = "Guarapuava \n Parana"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var locationContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.spacing = 5
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
        view.backgroundColor = .lightGray
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
        label.text = "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        selectionStyle = .none
        createLocationConstraints()
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
        
        let topConstraint = mainContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 15)
        let bottomConstraint = mainContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        
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
