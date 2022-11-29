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
    
    private var feed = [FeedImageViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        refresh()
    }
    
    @objc private func refresh() {
        refreshControl?.beginRefreshing()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            if self.feed.isEmpty {
                self.feed = FeedImageViewModel.prototypeFeed
                self.tableView.reloadData()
            }
            self.refreshControl?.endRefreshing()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        feed.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FeedImageCell.reuseIdentifier) as! FeedImageCell
        cell.configure(with: feed[indexPath.row])
        return cell
    }
    
    // MARK: - Private Methods
    private func configureTableViewController() {
        title = "My Feed"
        view.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        registerPrototypeCell()
    }
    
    private func registerPrototypeCell() {
        tableView.register(FeedImageCell.self, forCellReuseIdentifier: FeedImageCell.reuseIdentifier)
    }
    
    private func setTableViewHeaderAndFooter() {
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 16))
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 16))
    }
}
