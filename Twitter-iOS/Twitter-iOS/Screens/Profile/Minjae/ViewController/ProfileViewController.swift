//
//  MinJaeProfileViewController.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/15.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate {
    
    // MARK: UI
    @IBOutlet weak var backArrow: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileIdLabel: UILabel!
    @IBOutlet weak var introductionLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tabStackView: UIStackView!
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var barBackgroundView: UIView!
    
    // MARK: Passing Data
    private var userKeyId = ""
    
    // MARK: Constraints
    @IBOutlet weak var barViewLeading: NSLayoutConstraint!
    @IBOutlet weak var barViewWidth: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var containerViewHeight: NSLayoutConstraint!
    
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    private let contents: [UIViewController] = [
        UIStoryboard(name: "Tweet", bundle: nil).instantiateViewController(withIdentifier: TweetViewController.className),
        TweetAndReplyViewController(),
        MediaViewController(),
        FavoriteViewController()
    ]
    
    private lazy var tweetSB = contents.first
    
    // 현재 몇번째 페이지를 보고있는지 확인 위한 idx 변수
    private var currentIdx = 0
    private var btnTapped = false
    
    // MARK: Floating Button
    private let floatingButton = UIButton()
    private func setFloatingButton() {
        floatingButton.frame = CGRect(x: self.view.frame.size.width - 112, y: UIScreen.main.bounds.height - 160, width: 56, height: 56)
        floatingButton.setImage(ImageLiteral.Writing.iconBigPlus, for: .normal)
        floatingButton.addTarget(self, action: #selector(plutBtnTapped), for: .touchUpInside)
        self.view.addSubview(floatingButton)
    }
    
    @objc func plutBtnTapped() {
        let writingVC = SuYeonWritingViewController()
        writingVC.modalPresentationStyle = .fullScreen
        self.present(writingVC, animated: true)
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfileUI()
        setFloatingButton()
        setPageVC()
        getUserInfo()
        scrollView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // MARK: Custom Function
    private func setProfileUI() {
        makeImageCircle(profileImageView)
        makeButtonCircle(backArrow)
        makeButtonCircle(searchButton)
        
        guard let button = self.tabStackView.arrangedSubviews.first as? UIButton else { return }
        barViewWidth.constant = button.contentSize
        barViewLeading.constant = button.margin
    }
    
    private func setPageVC() {
        // ProfileViewController(부모)에 PageViewController(자식 VC) 추가
        self.addChild(pageViewController)
        
        // 컨테이너뷰의 크기를 pageVC의 root view의 크기와 맞춰줌
        containerView.frame = pageViewController.view.frame
        // pageVC도 가지고 있는 root view를 컨테이너뷰에 추가
        containerView.addSubView(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        // Protocol delegate
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        if let tweetVC = contents.first {
            pageViewController.setViewControllers([tweetVC], direction: .forward, animated: true)
            guard let vc = tweetVC as? TweetViewController else { return }
            vc.tableView.delegate = self
        }
        
        
        for subview in pageViewController.view.subviews {
            if let scrollView = subview as? UIScrollView {
                scrollView.delegate = self
            }
        }
    }
    
    private func makePageVCLeadingConstant(index: Array.Index) -> CGFloat {
        guard let button = self.tabStackView.arrangedSubviews[index] as? UIButton else { return 0 }
        var leadingConstant: CGFloat = 0
        
        for i in 0..<index {
            leadingConstant += self.tabStackView.arrangedSubviews[i].frame.width
        }
        
        leadingConstant += button.layoutMargins.left
        
        return leadingConstant
    }
    
    @IBAction func tweetBtnDidTap(_ sender: UIButton) {
        guard let index = tabStackView.arrangedSubviews.firstIndex(of: sender),
              index != currentIdx else { return }
        
        btnTapped = true
        UIView.animate(withDuration: 0.1) {
            
            guard let button = self.tabStackView.arrangedSubviews[index] as? UIButton else { return }
            
            self.barViewWidth.constant = CGFloat(self.tabStackView.arrangedSubviews[index].frame.width) - button.layoutMargins.right - button.layoutMargins.left
            
            // leading constant 새로 생성
            let leadingConstant = self.makePageVCLeadingConstant(index: index)
            self.barViewLeading.constant = leadingConstant
            // 바로 적용
            self.barBackgroundView.layoutIfNeeded()
        }
        
        let content = contents[index]
        pageViewController.setViewControllers([content], direction: currentIdx < index ? .forward : .reverse, animated: true) { _ in
            self.currentIdx = index
            self.btnTapped = false
        }

    }
    
}

extension ProfileViewController: UIPageViewControllerDelegate {
    
}

extension ProfileViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewController = pageViewController.viewControllers?.first,
              let index = contents.firstIndex(of: viewController) else { return }
        
        currentIdx = index
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = contents.firstIndex(of: viewController) else { return nil }
        let beforeIndex = index - 1
        if beforeIndex < 0 { return nil }
        
        return contents[beforeIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = contents.firstIndex(of: viewController) else { return nil }
        let afterIndex = index + 1
        if afterIndex == contents.count { return nil }
        
        return contents[afterIndex]
    }
}

// PageViewController도 scroll view를 상속받음
extension ProfileViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        guard let tweetVC = tweetSB as? TweetViewController else { return }
        let tweetTableView = tweetVC.tableView

        let yOffset = self.scrollView.contentOffset.y
        let tableOffsetY = tweetTableView?.contentOffset.y ?? 0
        
        if yOffset >= containerView.frame.origin.y {
            tweetTableView?.isScrollEnabled = true
        }
        
        if scrollView == tweetTableView {
            if tableOffsetY <= 0 {
                tweetTableView?.isScrollEnabled = false
            }
        }

        if scrollView == pageViewController.scrollView {
            
            guard !btnTapped else { return }
            
            let scrollOffsetX = scrollView.contentOffset.x
            // 여기는 왜 size.width? get만 할꺼면 size.width 할필요없고 그냥 frame.width해도 될듯
            let contentSizeWidth = view.frame.size.width
            
            // -1.0 ~ 1.0 (좌우 이동)
            let movement = (scrollOffsetX - contentSizeWidth) / contentSizeWidth
            
            let currentIdx: CGFloat = movement + CGFloat(currentIdx)
            let percent: CGFloat = currentIdx - CGFloat(Int(currentIdx))
            
            var leftWidth: CGFloat = 0, rightWidth: CGFloat = 0
            var leftX: CGFloat = 0, rightX: CGFloat = 0
            var leftMargin: CGFloat = 0, rightMargin: CGFloat = 0
            
            if let leftButton = tabStackView.arrangedSubviews[Int(currentIdx)] as? UIButton {
                leftWidth = leftButton.contentSize
                leftX = leftButton.frame.origin.x
                leftMargin = leftButton.margin
            }
            
            if Int(currentIdx) + 1 < contents.count, let rightButton = tabStackView.arrangedSubviews[Int(currentIdx) + 1] as? UIButton {
                rightWidth = rightButton.contentSize
                rightX = rightButton.frame.origin.x
                rightMargin = rightButton.margin
            }
            
            if Int(currentIdx) == contents.count - 1 {
                rightX = view.frame.width
                rightWidth = leftWidth
            }
            
            
            // (rightX - leftX) -> 음수
            let indicatorX = (rightX - leftX) * percent + leftX
            let indicatorWidth = (rightWidth - leftWidth) * percent  + leftWidth
            let buttonMargin = (rightMargin - leftMargin) * percent + leftMargin
            barViewLeading.constant = indicatorX + buttonMargin
            barViewWidth.constant = indicatorWidth
        }
        
    }
}

// PageViewController의 scrollView 접근
extension UIPageViewController {

    var scrollView: UIScrollView? {

        return view.subviews.filter { $0 is UIScrollView }.first as? UIScrollView
    }
}


extension ProfileViewController {
    private func getUserInfo() {

        UserService.shared.getUserInfo { result in
            switch result {
            case .success(let data):
                guard let data = data as? UserResponse else { return }
                self.userKeyId = data.id
                self.profileNameLabel.text = data.userName
                self.profileIdLabel.text = data.userId
                self.introductionLabel.text = data.introduce
                
                if let date = data.createdAt.toDate() {
                    let calendarDate = Calendar.current.dateComponents([.year, .month], from: date)
                    if let year = calendarDate.year, let month = calendarDate.month {
                        self.createdAtLabel.text = "\(year)년 \(month)월에 가입함"
                    }
                }
                
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
