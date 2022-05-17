//
//  SuYeonWritingViewController.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/15.
//

import UIKit

import SnapKit

class SuYeonWritingViewController: UIViewController {

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
    }

    private func setDelegation() {
        twitTextView.delegate = self
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
        // 피드 화면으로 돌아가기 + 데이터 전달 ! -> dismiss 하면 될거같음 !!
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
