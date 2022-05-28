//
//  TwitterRetwittTableViewCell.swift
//  Twitter-iOS
//
//  Created by 한유진 on 2022/05/19.
//

import UIKit

class TwitterRetwittTableViewCell: UITableViewCell {

    static let identifier = "TwitterRetwittTableViewCell"
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var didRetwittLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var retwittButton: UIButton!
    @IBOutlet weak var retwittCountLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var heartCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    func setUI() {
        makeImageCircle(profileImg)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setData(_ reTwittModel : TwittModel) {
        profileImg.image = reTwittModel.profileImage
        nameLabel.text = reTwittModel.nickName
        idLabel.text = reTwittModel.idLabel
        contentLabel.text = reTwittModel.content
    }
    
}
extension TwitterRetwittTableViewCell{
    func makeImageCircle(_ imageView: UIImageView) {
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.layer.borderWidth = 4
        imageView.layer.borderColor = UIColor.twitter_black.cgColor
        
        // 뷰의 경계에 맞춰주기
        imageView.clipsToBounds = true
    }
}
