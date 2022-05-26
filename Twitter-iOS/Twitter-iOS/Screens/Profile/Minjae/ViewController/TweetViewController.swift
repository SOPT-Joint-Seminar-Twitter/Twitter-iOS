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
        
        switch tweetDataList[indexPath.row].isReTweet {
        case false:
            // 리트윗 표시 icon & label
            // cell 위로 숨기는 방법
            cell.retweetIconTopConstraint.constant = -24
            cell.retweetIconBottomConstraint.constant = 7
            cell.bottomRetweetIcon.tintColor = .twitter_gray50
            cell.retweetCountLabel.isHidden = true
            
            // 높이 0 주는 방법
//            retweetIcon.heightAnchor.constraint(equalToConstant: 0).isActive = true
//            retweetLabel.heightAnchor.constraint(equalToConstant: 0).isActive = true
        case true:
            cell.activityBtn.isHidden = true
            cell.shareBtn.isHidden = true
            cell.bottomRetweetIcon.tintColor = .twitter_green
            cell.retweetIcon.tintColor = .twitter_gray50
            cell.bottomStackViewTrailing.constant = 70
            
        }
        
        cell.setData(dataModel: tweetDataList[indexPath.row])
        return cell
    }

}
