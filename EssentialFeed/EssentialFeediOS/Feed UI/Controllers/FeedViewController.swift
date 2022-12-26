//
//  FeedViewController.swift
//  EssentialFeediOS
//
//  Created by Vinicius Nadin on 01/12/22.
//

import UIKit

public final class ErrorView: UIView {
    public var message: String?
}

public final class FeedViewController: UITableViewController, UITableViewDataSourcePrefetching, FeedErrorView {
    
    var tableModel = [FeedImageCellController]() { didSet { tableView.reloadData() } }
    private var refreshController: FeedRefreshViewController?
    public var errorView: ErrorView?
    
    convenience init(refreshController: FeedRefreshViewController, errorView: ErrorView) {
        self.init()
        self.refreshController = refreshController
        self.errorView = errorView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl = refreshController?.view
        tableView.tableHeaderView = errorView
        tableView.prefetchDataSource = self
        tableView.register(FeedImageCell.self, forCellReuseIdentifier: String(describing: FeedImageCell.self))
        refreshController?.refresh()
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableModel.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellController(forRowAt: indexPath).view(in: tableView)
    }
    
    public override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cancelCellControllerLoad(forRowAt: indexPath)
    }
    
    func display(_ viewModel: FeedErrorViewModel) {
        errorView?.message = viewModel.message
    }
    
    public func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        indexPaths.forEach { indexPath in
            cellController(forRowAt: indexPath).preload()
        }
    }
    
    public func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath]) {
        indexPaths.forEach(cancelCellControllerLoad)
    }
    
    private func cellController(forRowAt indexPath: IndexPath) -> FeedImageCellController {
        tableModel[indexPath.row]
    }
    
    private func cancelCellControllerLoad(forRowAt indexPath: IndexPath) {
        cellController(forRowAt: indexPath).cancelLoad()
    }
}
