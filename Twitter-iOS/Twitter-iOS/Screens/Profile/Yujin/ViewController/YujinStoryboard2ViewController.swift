//
//  YujinStoryboard2ViewController.swift
//  Twitter-iOS
//
//  Created by 한유진 on 2022/05/26.
//

import UIKit
class YujinStoryboard2ViewController: UIViewController {
    
    // MARK: - Profile
    private var userKeyId : String = ""
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var introduce: UILabel!
    
    // MARK: - TableView
    var twittDataList : [TwittResponse] = []
    @IBOutlet weak var tabbar: UIView!
    
    @IBOutlet weak var width: NSLayoutConstraint! //headerVIew의 최소 높이값
    let maxHeight: CGFloat = 340.0 //headerView의 최대 높이값
    lazy var minHeight: CGFloat = self.width.constant + 80
    @IBOutlet weak var mainTableView: UITableView!{
        didSet {
            mainTableView.contentInset = UIEdgeInsets(top: maxHeight , left: 0, bottom: 0, right: 0)
        }
    }
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var upperHeaderView: UIView!
    
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
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint! {
        didSet {
            heightConstraint.constant = maxHeight
        }
    }
    // MARK: - Set 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        getUser()
        setDelegation()
        setFloatingButton()
    }
    override func viewWillAppear(_ animated: Bool) {
        getTwittList()
    }
    private func setDelegation() {
        mainTableView.delegate = self
        mainTableView.dataSource = self
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
    @objc private func didTapButton() {
        let SuYeonWritingViewController = SuYeonWritingViewController()
        SuYeonWritingViewController.modalPresentationStyle = .fullScreen
        self.present(SuYeonWritingViewController, animated: true)
    }
    private func registerCell() {
        let myTwittNib = UINib(nibName: TwitterMyTwittTableViewCell.identifier, bundle: nil)
        let reTwittNib = UINib(nibName: TwitterRetwittTableViewCell.identifier, bundle: nil)
        mainTableView.register(myTwittNib, forCellReuseIdentifier: TwitterMyTwittTableViewCell.identifier)
        mainTableView.register(reTwittNib, forCellReuseIdentifier: TwitterRetwittTableViewCell.identifier)
    }
}

// MARK: - TableView Delegate
extension YujinStoryboard2ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            heightConstraint.constant = max(abs(scrollView.contentOffset.y), minHeight)
        } else {
            heightConstraint.constant = minHeight
        }
        let offset = -scrollView.contentOffset.y
        let percentage = (offset-100)/50
        upperHeaderView.alpha = percentage
    }
}
extension YujinStoryboard2ViewController : UITableViewDataSource{
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
extension YujinStoryboard2ViewController {
    func getTwittList() {
        
        TwittService.shared.getList {
            result in
            switch result {
            case .success(let dataList):
                guard let twittList = dataList as? [TwittResponse] else {return}
                self.twittDataList = twittList
                self.mainTableView.reloadData()
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
extension YujinStoryboard2ViewController {
    
    func getUser() {
        
        TwittService.shared.getUser() { result in
            switch result {
            case .success(let data):
                guard let data = data as? UserResponse else {return}
                self.userKeyId = data.id
                self.userName.text = data.userName
                self.userId.text = data.userId
                self.introduce.text = data.introduce
                self.createdAt.text = self.formatDate(dataStr: data.createdAt)
                print("성공")
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
    func formatDate(dataStr : String) -> String {
        //문자열 -> Date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        //Date -> 문자열
        guard let convertDate = dateFormatter.date(from: dataStr) else{return ""}// Date터입으로 변환
        let myDateFomatter = DateFormatter()
        myDateFomatter.dateFormat = "YYYY년 MM월에 가입함"
        myDateFomatter.timeZone = TimeZone(identifier: "UTC")
        
        let convertStr = myDateFomatter.string(from: convertDate)
        return convertStr
    }
}


