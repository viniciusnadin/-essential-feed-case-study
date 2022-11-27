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
        10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: FeedImageCell.reuseIdentifier)!
    }
}
