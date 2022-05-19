//
//  TweetViewController.swift
//  Twitter-iOS
//
//  Created by 김민재 on 2022/05/18.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var tweetDataList = TweetResponse.sampleData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        setTableView()
    }

    private func registerXib() {
        let nib = UINib(nibName: TweetTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TweetTableViewCell.identifier)
    }

    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
    }
}

extension TweetViewController: UITableViewDelegate {

}

extension TweetViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TweetResponse.sampleData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as? TweetTableViewCell else { return UITableViewCell() }
        
        cell.setData(dataModel: tweetDataList[indexPath.row])
        return cell
    }

}
