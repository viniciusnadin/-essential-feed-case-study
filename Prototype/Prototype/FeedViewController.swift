//
//  ViewController.swift
//  Prototype
//
//  Created by Vinicius Nadin on 27/11/22.
//

import UIKit

struct FeedImageViewModel {
    let description: String?
    let location: String?
    let imageName: String
}

class FeedViewController: UITableViewController {
    
    private let feed = FeedImageViewModel.prototypeFeed

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.separatorStyle = .none
        registerPrototypeCell()
        title = "My Feed"
    }
    
    private func registerPrototypeCell() {
        tableView.register(FeedImageCell.self, forCellReuseIdentifier: FeedImageCell.reuseIdentifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        feed.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedImageCell.reuseIdentifier) as! FeedImageCell
        cell.configure(with: feed[indexPath.row])
        return cell
    }
}
