//
//  TweetViewController.swift
//  Twitter-iOS
//
//  Created by 김민재 on 2022/05/18.
//

import UIKit

class TweetViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    var tweetDataList: [Twit] = []
    var likeModel: Like?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        setTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTwitList()
    }

    private func registerXib() {
        let nib = UINib(nibName: TweetTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: TweetTableViewCell.identifier)
    }

    private func setTableView() {
        tableView.isScrollEnabled = false
        tableView.dataSource = self

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
    }
}

extension TweetViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        tableView.endUpdates()
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        tableView.endUpdates()
    }

}

extension TweetViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetDataList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.identifier, for: indexPath) as? TweetTableViewCell else { return UITableViewCell() }
        
        switch tweetDataList[indexPath.row].isRetwit {
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
            cell.bottomStackViewTrailing.constant = 120
        }
        
        cell.closure = {
            self.likeTwit(postId: self.tweetDataList[indexPath.row].id)
            if let model = self.likeModel {
                cell.setLikeData(dataModel: model)
            }
        }
        
        cell.setData(dataModel: tweetDataList[indexPath.row])
        return cell
    }

}


extension TweetViewController {
    private func getTwitList() {
        
        UserService.shared.getTwitList { result in
            switch result {
            case .success(let data):
                guard let twitList = data as? [Twit] else { return }
                self.tweetDataList = twitList
                
                self.tableView.reloadData()
            case .requestErr:
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}


extension TweetViewController {
    
    private func likeTwit(postId: String) {
        UserService.shared.likeTwit(postId: postId) { result in
            switch result {
            case .success(let data):
                guard let data = data as? Like else { return }
                self.likeModel = data
//                let cellVC = Bundle.main.loadNibNamed("TweetTableViewCell", owner: nil)?.first as? TweetTableViewCell
//                cellVC?.setLikeData(dataModel: data)
                
            case .requestErr:
                print("requestErr")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
        
    }
}
