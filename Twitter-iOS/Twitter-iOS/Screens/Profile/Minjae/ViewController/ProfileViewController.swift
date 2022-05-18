//
//  MinJaeProfileViewController.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/15.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var backArrow: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var barViewWidth: NSLayoutConstraint!
    @IBOutlet weak var barView: UIView!
    @IBOutlet weak var barBackgroundView: UIView!
    @IBOutlet weak var barViewLeading: NSLayoutConstraint!
    
    @IBOutlet weak var containerView: UIView!
    
    private let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    private let contents: [UIViewController] = [
    
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setProfileUI()
    }
    
    private func setProfileUI() {
        makeImageCircle(profileImageView)
        makeButtonCircle(backArrow)
        makeButtonCircle(searchButton)
    }
}
