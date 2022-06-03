//
//  TweetTableViewCell.swift
//  Twitter-iOS
//
//  Created by 김민재 on 2022/05/18.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    static var identifier = "TweetTableViewCell"

    @IBOutlet weak var retweetIconTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var contentWidth: NSLayoutConstraint!
    @IBOutlet weak var retweetIconBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var profileImageLeading: NSLayoutConstraint!
    @IBOutlet weak var profileImageTrailing: NSLayoutConstraint!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeCountLabel: UILabel!
    // 숨김 처리해야할 부분
    @IBOutlet weak var activityBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var retweetIcon: UIImageView!
    @IBOutlet weak var retweetLabel: UILabel!
    
    @IBOutlet weak var likeCountLabelWidth: NSLayoutConstraint!
    @IBOutlet weak var bottomStackViewTrailing: NSLayoutConstraint!
    
    @IBOutlet weak var bottomRetweetIcon: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileIDAndSec: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var retweetCountLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    let labelTrailingConstant: CGFloat = 27
    
    var closure: (() -> Void)?
    
    func setData(dataModel: Twit) {
        profileImage.image = ImageLiteral.Writing.imgProfile4
        profileImage.makeRounded(cornerRadius: profileImage.frame.width / 2)
        profileIDAndSec.text = "@\(dataModel.writer.userId) ∙ 2일전"

        profileName.text = dataModel.writer.userName
        tweetContent.text = dataModel.content
        if dataModel.likeCount == 0 {
            likeCountLabel.isHidden = true
        } else {
            likeCountLabel.text = dataModel.likeCount.description
        }
        
        likeButton.isSelected = dataModel.isLike
        if likeButton.isSelected {
            likeButton.setImage(UIImage(named: "iconHeartOn"), for: .selected)
        } else {
            likeButton.setImage(UIImage(named: "iconHeart"), for: .normal)
        }
        
        contentWidth.constant = UIScreen.main.bounds.width - (profileImage.frame.width + profileImageLeading.constant + profileImageTrailing.constant + labelTrailingConstant)
    }
    
    func setLikeData(dataModel: Like) {
        likeButton.isSelected = dataModel.isLike
        if dataModel.likeCount == 0 {
            likeCountLabel.isHidden = true
        } else {
            likeCountLabel.text = dataModel.likeCount.description
        }
        
        if likeButton.isSelected {
            likeButton.setImage(UIImage(named: "iconHeartOn"), for: .selected)
        } else {
            likeButton.setImage(UIImage(named: "iconHeart"), for: .normal)
        }
    }
    
    @IBAction func likeBtnDidTapped(_ sender: UIButton) {
        closure?()
    }
    
}
