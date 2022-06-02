//
//  TwitterRetwittTableViewCell.swift
//  Twitter-iOS
//
//  Created by 한유진 on 2022/05/19.
//

import UIKit

class TwitterRetwittTableViewCell: UITableViewCell {

    static let identifier = "TwitterRetwittTableViewCell"
    var postId = ""
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
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

        if heartButton.isSelected {
            print("pushed!!")
            heartButton.setImage(UIImage(named:"iconHeartOn"), for: .selected)
        }
        else {
            print("not pushed!!")
            heartButton.setImage(UIImage(named: "iconHeart"), for: .normal)
        }
    }
    func setData(_ reTwittModel : TwittResponse) {
        profileImg.image = ImageLiteral.Writing.imgProfile3
        nameLabel.text = reTwittModel.writer.userName
        idLabel.text = "\(reTwittModel.writer.userId) ∙ 3일전"
        contentLabel.text = reTwittModel.content
        postId = reTwittModel.twitId
        print(postId,"postIDDDD")
        if heartButton.isSelected {
            print("pushed!!")
            self.heartCountLabel.isHidden = false
            heartButton.setImage(UIImage(named:"iconHeartOn"), for: .selected)
        }
        else {
            print("not pushed!!")
            heartButton.setImage(UIImage(named: "iconHeart"), for: .normal)
        }
    }
    @IBAction func heartButtonDidTapped(_ sender: UIButton) {
        postLike(postId: postId)
    }
}
// MARK: - 서버 통신
extension TwitterRetwittTableViewCell{
    func postLike(postId:String) {
        TwittService.shared.postLike(postId: postId){
            result in
            switch result{
            case .success(let data):
                guard let data = data as? LikeResponse else { return }
                if data.likeCount.description == "0"{
                    self.heartCountLabel.isHidden = true
                }
                else {
                    self.heartCountLabel.isHidden = false
                    self.heartCountLabel.text = data.likeCount.description
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
extension TwitterRetwittTableViewCell{
    func makeImageCircle(_ imageView: UIImageView) {
        imageView.layer.cornerRadius = imageView.frame.height / 2
        imageView.layer.borderWidth = 4
        imageView.layer.borderColor = UIColor.twitter_black.cgColor
        
        // 뷰의 경계에 맞춰주기
        imageView.clipsToBounds = true
    }
}
