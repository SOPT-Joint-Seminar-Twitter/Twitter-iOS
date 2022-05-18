//
//  ImageCollectionViewCell.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/18.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    var albumImageView: UIImageView = {
        let image = UIImageView()
        image.image = ImageLiteral.Writing.imgProfile2
        image.contentMode = .scaleToFill
        return image
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

    override func prepareForReuse() {
        albumImageView.image = nil
    }

    private func render() {
        self.addSubView(albumImageView)

        albumImageView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }

    private func configUI() {
        self.backgroundColor = .twitter_black
        layer.cornerRadius = 16
        layer.borderWidth = 1
        layer.borderColor = UIColor.twitter_gray50.cgColor
        clipsToBounds = true
    }

    func update(data: MyPhoto) {
        albumImageView.image = data.makeAlbumImage()
    }
}
