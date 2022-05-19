//
//  TweetTableViewCell.swift
//  Twitter-iOS
//
//  Created by 김민재 on 2022/05/18.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    static var identifier = "TweetTableViewCell"

    @IBOutlet weak var contentWidth: NSLayoutConstraint!
    
    @IBOutlet weak var profileImageLeading: NSLayoutConstraint!
    
    @IBOutlet weak var profileImageTrailing: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileIDAndSec: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    let labelTrailingConstant: CGFloat = 27
    
    func setData(dataModel: TweetResponse) {
        profileImage.image = UIImage(named: dataModel.profileImage)
        profileImage.makeRounded(cornerRadius: profileImage.frame.width / 2)
        profileIDAndSec.text = "@\(dataModel.profileID) ∙ \(dataModel.createdAt)"

        profileName.text = dataModel.profileName
        tweetContent.text = dataModel.content

        contentWidth.constant = UIScreen.main.bounds.width - (profileImage.frame.width + profileImageLeading.constant + profileImageTrailing.constant + labelTrailingConstant)

    }
    
}
