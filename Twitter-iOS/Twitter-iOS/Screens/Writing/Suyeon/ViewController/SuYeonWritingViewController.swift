//
//  SuYeonWritingViewController.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/15.
//

import UIKit

import SnapKit

class SuYeonWritingViewController: UIViewController {

    var userId: String?
    var userName: String?

    private let placeHolder: UILabel = {
        let label = UILabel()
        label.text = "무슨 일이 일어나고 있나요?"
        label.font = .font(.robotoRegular, ofSize: 18)
        label.textColor = .twitter_gray50
        return label
    }()

    private lazy var cancleButton: UIButton = {
        var configuration = UIButton.Configuration.plain()

        var container = AttributeContainer()
        container.font = .font(.robotoRegular, ofSize: 16)

        configuration.attributedTitle = AttributedString("취소", attributes: container)
        configuration.baseForegroundColor = UIColor.twitter_white
        configuration.contentInsets = .zero

        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.addTarget(self, action: #selector(cancelButtonDidTap(_:)), for: .touchUpInside)
        return button
    }()

    private lazy var twitButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        var container = AttributeContainer()
        container.font = .font(.robotoBold, ofSize: 12)

        configuration.attributedTitle = AttributedString("트윗", attributes: container)

        configuration.background.cornerRadius = 40
        configuration.background.backgroundColor = .twitter_blue3
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)

        let button = UIButton(configuration: configuration, primaryAction: nil)
        button.addTarget(self, action: #selector(twitButtonDidTap(_:)), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()

    var profileImageView: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: 0, y: 0, width: 34, height: 34))
        iv.image = ImageLiteral.Writing.imgProfile1
        iv.layer.cornerRadius = iv.frame.height / 2
        iv.clipsToBounds = true
        return iv
    }()

    var twitTextView: UITextView = {
        let textView = UITextView()
        textView.text = "무슨 일이 일어나고 있나요?"
        textView.textColor = .twitter_gray50
        textView.tintColor = .twitter_blue1
        textView.backgroundColor = .twitter_black
        textView.font = .font(.robotoRegular, ofSize: 18)
        return textView
    }()

    private let writingToolBar = WritingToolBar()
    private let commentPermissionView = CommentPermissionView()
    private lazy var albumCollectionView = AlbumCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        render()
        setDelegation()
        setButtonState()
        setKeyboard()
        registerCell()
    }

    private func configUI() {
        view.backgroundColor = .twitter_black
    }

    private func render() {
        view.addSubViews([cancleButton, twitButton, twitTextView, profileImageView, writingToolBar, commentPermissionView, albumCollectionView])

        twitTextView.addSubView(placeHolder)

        cancleButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(59)
            $0.leading.equalToSuperview().inset(16)
        }

        profileImageView.snp.makeConstraints {
            $0.top.equalTo(cancleButton.snp.bottom).offset(14)
            $0.leading.equalToSuperview().inset(16)
            $0.height.width.equalTo(34)
        }

        placeHolder.snp.makeConstraints {
            $0.top.equalToSuperview().inset(9)
            $0.leading.equalToSuperview().inset(5)
        }

        twitTextView.snp.makeConstraints {
            $0.leading.equalTo(profileImageView.snp.trailing).offset(8)
            $0.top.equalToSuperview().inset(91)
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview()
        }

        twitButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(53)
            $0.trailing.equalToSuperview().inset(16)
        }

        writingToolBar.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.keyboardLayoutGuide.snp.top)
            $0.height.equalTo(50.adjustedH)
        }

        commentPermissionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(writingToolBar.snp.top)
            $0.height.equalTo(46.adjustedH)
        }

        albumCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(commentPermissionView.snp.top).offset(-10)
            $0.height.equalTo(80.adjustedH)
        }
    }

    private func setDelegation() {
        twitTextView.delegate = self
        albumCollectionView.dataSource = self
    }

    private func setButtonState() {
        let buttonStateHandler: UIButton.ConfigurationUpdateHandler = { button in
            var container = AttributeContainer()

            switch button.state {
            case .normal:
                container.font = .font(.robotoBold, ofSize: 12)
                container.foregroundColor = UIColor.twitter_white
                button.configuration?.attributedTitle = AttributedString("트윗", attributes: container)
                button.configuration?.background.backgroundColor = .twitter_blue1
            case .disabled:
                container.font = .font(.robotoBold, ofSize: 12)
                container.foregroundColor = UIColor.twitter_blue4

                button.configuration?.attributedTitle = AttributedString("트윗", attributes: container)
                button.configuration?.background.backgroundColor = .twitter_blue3
            default:
                return
            }
        }

        twitButton.configurationUpdateHandler = buttonStateHandler

    }

    @objc
    private func twitButtonDidTap(_ button: UIButton) {
        writingToolBar.isHidden = true
        albumCollectionView.isHidden = true
        commentPermissionView.isHidden = true
        postTwit()
        self.dismiss(animated: true)
    }

    @objc
    private func cancelButtonDidTap(_ button: UIButton) {
        writingToolBar.isHidden = true
        albumCollectionView.isHidden = true
        commentPermissionView.isHidden = true
        self.dismiss(animated: true)
    }

    private func setKeyboard() {
        twitTextView.becomeFirstResponder()
    }

    private func registerCell() {
        albumCollectionView.register(cell: IconCollectionViewCell.self)
        albumCollectionView.register(cell: ImageCollectionViewCell.self)
    }
}

extension SuYeonWritingViewController: UITextViewDelegate {

    func textViewDidBeginEditing(_ textView: UITextView) {
        if twitTextView.textColor == .twitter_gray50 {
            twitTextView.text = nil
            twitTextView.textColor = .twitter_white
        }
    }

    func textViewDidChange(_ textView: UITextView) {
        twitButton.isEnabled = twitTextView.hasText ? true : false
        placeHolder.isHidden = twitTextView.text.isEmpty ? false : true
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if twitTextView.text.isEmpty {
            twitTextView.text = "무슨 일이 일어나고 있나요?"
            twitTextView.textColor = .twitter_gray50
        }
    }
}

extension SuYeonWritingViewController {
    private func postTwit() {
        guard let content = twitTextView.text
        else { return }

        /// 이전 트윗 화면에서 받아와야되는데 일단은 임시로 넣어둠 ! 민재 유진 화면에서 화면 전환할때 userId랑 userName 데이터 전달 해주세요!
        let userId = "6290711bc126089210da4b1a"
        let userName = "먀막"

        TwitPostService.shared.postTwit(content: content, writer: Writer(id: userId, userName: userName)) { result in
            switch result {
            case .success:
                print("성공")
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
