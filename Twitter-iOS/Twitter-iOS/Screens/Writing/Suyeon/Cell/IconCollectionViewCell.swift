//
//  IconCollectionViewCell.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/18.
//

import UIKit

enum IconCollectionViewCellType {
    case sound
    case camera
}

class IconCollectionViewCell: UICollectionViewCell {

    var iconImageView: UIImageView = {
        let image = UIImageView()
        image.image = ImageLiteral.Writing.iconSound
        return image
    }()

    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render(type: IconCollectionViewCellType) {
        self.addSubView(iconImageView)

        switch type {
        case .sound:
            iconImageView.image = ImageLiteral.Writing.iconSound
            iconImageView.snp.makeConstraints {
                $0.top.bottom.equalToSuperview().inset(28)
                $0.leading.trailing.equalToSuperview().inset(29)
            }
        case .camera:
            iconImageView.image = ImageLiteral.Writing.iconCamera
            iconImageView.snp.makeConstraints {
                $0.top.bottom.leading.trailing.equalToSuperview().inset(26)
            }
        }
    }

    private func configUI() {
        self.backgroundColor = .twitter_black
        layer.cornerRadius = 16
        layer.borderWidth = 1
        layer.borderColor = UIColor.twitter_gray50.cgColor
        clipsToBounds = true
    }
}
