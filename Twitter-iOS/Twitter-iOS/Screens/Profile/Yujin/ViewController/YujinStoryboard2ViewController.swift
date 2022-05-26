//
//  YujinStoryboard2ViewController.swift
//  Twitter-iOS
//
//  Created by 한유진 on 2022/05/26.
//

import UIKit
class YujinStoryboard2ViewController: UIViewController {
    
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
    
    // MARK: - UI
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        self.view.addSubView(floatingButton)
        registerCell()
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

// MARK: - Delegate
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
        //        print(indexPath.row)
        let twittCells = TwittModel.sampleData[indexPath.row]
        
        switch indexPath.row {
            
        default:
            if twittCells.type == .myTwitt {
                //                print("indexPath == myTwitt", indexPath.row)
                guard let cell = tableView.dequeueReusableCell(withIdentifier: TwitterMyTwittTableViewCell.identifier) as? TwitterMyTwittTableViewCell else {return UITableViewCell() }
                cell.setData(TwittModel.sampleData[indexPath.row])
                return cell
            } else {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: TwitterRetwittTableViewCell.identifier) as? TwitterRetwittTableViewCell else {return UITableViewCell() }
                cell.setData(TwittModel.sampleData[indexPath.row])
                return cell
            }
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TwittModel.sampleData.count
    }
}


