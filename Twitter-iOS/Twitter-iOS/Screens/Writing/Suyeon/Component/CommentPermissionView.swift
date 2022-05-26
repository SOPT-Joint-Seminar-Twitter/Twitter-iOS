//
//  CommentPermissionView.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/18.
//

import UIKit

class CommentPermissionView: UIView {

    // MARK: - property

    private let permissionImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = ImageLiteral.Writing.iconEarth
        return iv
    }()

    private let permissionLabel: UILabel = {
        let label = UILabel()
        label.text = "모든 사람이 답글을 달 수 있습니다"
        label.textColor = .twitter_blue1
        label.font = .font(.robotoRegular, ofSize: 12)
        return label
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
        addSubViews([permissionImageView, permissionLabel])

        permissionImageView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview().inset(16)
            $0.width.equalTo(14.adjusted)
        }

        permissionLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(15)
            $0.leading.equalTo(permissionImageView.snp.trailing).offset(10)
        }
    }

    private func configUI() {
        backgroundColor = .black
    }
}
