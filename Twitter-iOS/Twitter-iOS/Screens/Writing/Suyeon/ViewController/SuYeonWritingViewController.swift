//
//  SuYeonWritingViewController.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/15.
//

import UIKit

import SnapKit

class SuYeonWritingViewController: UIViewController {

    private lazy var cancleButton: UIButton = {
        var configuration = UIButton.Configuration.plain()

        var container = AttributeContainer()
        container.font = .font(.robotoRegular, ofSize: 16)

        configuration.attributedTitle = AttributedString("취소", attributes: container)
        configuration.baseForegroundColor = UIColor.twitter_white
        configuration.contentInsets = .zero

        let button = UIButton(configuration: configuration, primaryAction: nil)
        return button
    }()

    private lazy var twitButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        var container = AttributeContainer()
        container.font = .font(.robotoBold, ofSize: 12)

        configuration.attributedTitle = AttributedString("트윗", attributes: container)

        configuration.baseForegroundColor = UIColor.twitter_blue4
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
        textView.font = .font(.robotoRegular, ofSize: 18)
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        render()
        setDelegation()
        setButtonState()
    }

    private func configUI() {
        view.backgroundColor = .twitter_black
    }

    private func render() {
        view.addSubViews([cancleButton, twitButton, twitTextView, profileImageView])

        cancleButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(59)
            $0.leading.equalToSuperview().inset(16)
        }

        profileImageView.snp.makeConstraints {
            $0.top.equalTo(cancleButton.snp.bottom).offset(14)
            $0.leading.equalToSuperview().inset(16)
            $0.height.width.equalTo(34)
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
    }

    private func setDelegation() {
        twitTextView.delegate = self
    }

    private func setButtonState() {
        let buttonStateHandler: UIButton.ConfigurationUpdateHandler = { button in
            switch button.state {
            case .normal:
                button.configuration?.baseForegroundColor = UIColor.twitter_white
                button.configuration?.background.backgroundColor = .twitter_blue1
            case .disabled:
                button.configuration?.baseForegroundColor = UIColor.twitter_blue4
                button.configuration?.background.backgroundColor = .twitter_blue3
            default:
                return
            }
        }

        twitButton.configurationUpdateHandler = buttonStateHandler

    }

    @objc
    private func twitButtonDidTap(_ button: UIButton) {
        // 피드 화면으로 돌아가기 + 데이터 전달 ! -> dismiss 하면 될거같음 !!
    }
}

extension SuYeonWritingViewController: UITextViewDelegate {
    func textViewDidChangeSelection(_ textView: UITextView) {
        twitButton.isEnabled = twitTextView.hasText ? true : false
    }
}
