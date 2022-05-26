//
//  WritingToolBar.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/18.
//

import UIKit

class WritingToolBar: UIView {

    // MARK: - property

    private let leftStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 6
        stack.alignment = .leading
        stack.distribution = .fillEqually
        return stack
    }()

    private lazy var albumButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.Writing.iconImage, for: .normal)
        return button
    }()

    private lazy var gifButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.Writing.iconGif, for: .normal)
        return button
    }()

    private lazy var chartButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.Writing.iconChart, for: .normal)
        return button
    }()

    private lazy var locationButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.Writing.iconLocation, for: .normal)
        return button
    }()

    private let progressImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = ImageLiteral.Writing.iconCircle
        return iv
    }()

    private let separateView: UIView = {
        let view = UIView()
        view.backgroundColor = .twitter_gray100
        return view
    }()

    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.Writing.iconPlus, for: .normal)
        return button
    }()


    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
        configUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - func

    private func render() {
        addSubViews([leftStackView, progressImageView, separateView, plusButton])

        leftStackView.addArrangedSubviews(albumButton, gifButton, chartButton, locationButton)

        leftStackView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().inset(201.adjusted)
        }

        plusButton.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().inset(5)
        }

        separateView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(12)
            $0.trailing.equalTo(plusButton.snp.leading).offset(-7)
            $0.width.equalTo(1)
        }

        progressImageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(4)
            $0.trailing.equalTo(separateView.snp.leading).offset(-5)
            $0.width.equalTo(42.adjusted)
        }
    }

    private func configUI() {
        backgroundColor = .black
    }
}
