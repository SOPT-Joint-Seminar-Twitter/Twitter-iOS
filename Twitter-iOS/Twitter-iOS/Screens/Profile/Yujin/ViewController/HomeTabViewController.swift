//
//  FirstTabViewController.swift
//  Twitter-iOS
//
//  Created by 한유진 on 2022/05/19.
//

import UIKit

class HomeTabVHomeTabViewController: UIViewController {
    
    // MARK: - Floating Button
    private let floatingButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        button.backgroundColor = .twitter_blue1
        let image = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .medium))
        button.setImage(image, for: .normal)
        button.tintColor = .twitter_white
        button.layer.cornerRadius = 30
        return button
    }()
    @IBOutlet weak var tableView: UITableView!
    var twittDataList : [TwittResponse] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setDelegation()
        setFloatingButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        getTwittList()
    }
    @objc private func didTapButton() {
        let SuYeonWritingViewController = SuYeonWritingViewController()
        SuYeonWritingViewController.modalPresentationStyle = .fullScreen
        self.present(SuYeonWritingViewController, animated: true)
    }
    private func registerCell() {
        let myTwittNib = UINib(nibName: TwitterMyTwittTableViewCell.identifier, bundle: nil)
        let reTwittNib = UINib(nibName: TwitterRetwittTableViewCell.identifier, bundle: nil)
        tableView.register(myTwittNib, forCellReuseIdentifier: TwitterMyTwittTableViewCell.identifier)
        tableView.register(reTwittNib, forCellReuseIdentifier: TwitterRetwittTableViewCell.identifier)
    }
    private func setDelegation() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    private func setFloatingButton() {
        self.view.addSubView(floatingButton)
        floatingButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatingButton.frame = CGRect(x: view.frame.size.width * 0.8,
                                      y: view.frame.size.height * 0.8,
                                      width: 56,
                                      height: 56)
    }
}
extension HomeTabVHomeTabViewController {
    
    func getTwittList() {
        
        TwittService.shared.getList {
            result in
            switch result {
            case .success(let dataList):
                guard let twittList = dataList as? [TwittResponse] else {return}
                self.twittDataList = twittList
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

extension HomeTabVHomeTabViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
extension HomeTabVHomeTabViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if twittDataList[indexPath.row].isRetwit == false {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TwitterMyTwittTableViewCell.identifier) as? TwitterMyTwittTableViewCell else {return UITableViewCell() }
            cell.setData(twittDataList[indexPath.row])
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TwitterRetwittTableViewCell.identifier) as? TwitterRetwittTableViewCell else {return UITableViewCell() }
            cell.setData(twittDataList[indexPath.row])
            return cell
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return twittDataList.count
    }
}
