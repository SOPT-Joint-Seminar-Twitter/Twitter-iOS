//
//  ProfileTableViewCell.swift
//  Twitter-iOS
//
//  Created by 한유진 on 2022/05/26.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    static let identifier = "ProfileTableViewCell"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var instagramIDLabel: UILabel!
    @IBOutlet weak var profileContentLabel: UILabel!
    @IBOutlet weak var madeAccoutDateLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var profileUpdateButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(_ profileData : ProfileModel) {
        nameLabel.text = profileData.name
        profileImg.image  = profileData.profileImage
        instagramIDLabel.text = profileData.instagramID
        profileContentLabel.text = profileData.content
        madeAccoutDateLabel.text = profileData.madeAccountDate
        followerCountLabel.text = profileData.follower.description
        followingCountLabel.text = profileData.follwing.description
    }
}
