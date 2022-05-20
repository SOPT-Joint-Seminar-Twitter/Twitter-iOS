//
//  TwitterMyTwittTableViewCell.swift
//  Twitter-iOS
//
//  Created by 한유진 on 2022/05/19.
//

import UIKit

class TwitterMyTwittTableViewCell: UITableViewCell {

    /// Cell구분 위한 identifier
    static let identifier = "TwitterMyTwittTableViewCell"
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var retwittButton: UIButton!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var staticsButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(_ myTwittData : TwittModel) {
        profileImage.image = myTwittData.profileImage
        nickNameLabel.text = myTwittData.nickName
        idLabel.text = myTwittData.idLabel
        contentLabel.text = myTwittData.content
    }
    
}
