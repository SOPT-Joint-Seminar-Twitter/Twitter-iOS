//
//  YuJinProfileViewController.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/15.
//

import UIKit

class YuJinProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var instagramIDLabel: UILabel!
    @IBOutlet weak var profileContentLabel: UILabel!
    @IBOutlet weak var madeAccoutDateLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var profileUpdateButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
}
