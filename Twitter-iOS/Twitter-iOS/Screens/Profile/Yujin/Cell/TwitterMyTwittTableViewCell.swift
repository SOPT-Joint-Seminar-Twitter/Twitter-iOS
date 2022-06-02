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
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func setData(_ myTwittData : TwittResponse) {
        profileImage.image = ImageLiteral.Writing.imgProfile6
        profileImage.makeRounded(cornerRadius: profileImage.frame.width / 2)
        nickNameLabel.text = myTwittData.writer.userName
        contentLabel.text = myTwittData.content
        idLabel.text = myTwittData.writer.id
    }
}
