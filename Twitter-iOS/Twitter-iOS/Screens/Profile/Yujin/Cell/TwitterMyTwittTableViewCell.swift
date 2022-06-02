//
//  TwitterMyTwittTableViewCell.swift
//  Twitter-iOS
//
//  Created by 한유진 on 2022/05/19.
//

import UIKit
import Pageboy

class TwitterMyTwittTableViewCell: UITableViewCell {

    /// Cell구분 위한 identifier
    static let identifier = "TwitterMyTwittTableViewCell"
    var postId = ""
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var retwittButton: UIButton!
    @IBOutlet weak var heartButton: UIButton!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var staticsButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        postLike(postId: postId)
    }
    func setUI() {
        makeImageCircle(profileImage)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if heartButton.isSelected {
            print("pushed!!")
            heartButton.setImage(UIImage(named:"iconHeartOn"), for: .selected)
        }
        else {
            print("not pushed!!")
            heartButton.setImage(UIImage(named: "iconHeart"), for: .normal)
        }
    }
    func setData(_ myTwittData : TwittResponse) {
        profileImage.image = ImageLiteral.Writing.imgProfile6
        nickNameLabel.text = myTwittData.writer.userName
        contentLabel.text = myTwittData.content
        idLabel.text = "\(myTwittData.writer.userId) ∙ 2일전"
        postId = myTwittData.twitId
    }
    @IBAction func heartButtonDidTapped(_ sender: UIButton) {
        print("pushed tapped")
        postLike(postId: postId)
    }
}
// MARK: - 서버 통신
extension TwitterMyTwittTableViewCell{
    func postLike(postId:String) {
        TwittService.shared.postLike(postId: postId){
            result in
            switch result{
            case .success(let data):
                guard let data = data as? LikeResponse else { return }
                if data.likeCount.description == "0"{
                    self.likeCount.isHidden = true
                }
                else {
                    self.likeCount.isHidden = false
                    self.likeCount.text = data.likeCount.description
                }
                self.heartButton.isSelected = data.isLike
                self.setSelected(true, animated: true)
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
// MARK: - UI
extension TwitterMyTwittTableViewCell{
    func makeImageCircle(_ imageView: UIImageView) {
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.layer.borderWidth = 4
        imageView.layer.borderColor = UIColor.twitter_black.cgColor
        
        // 뷰의 경계에 맞춰주기
        imageView.clipsToBounds = true
    }
}
