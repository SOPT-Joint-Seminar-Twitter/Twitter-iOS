//
//  AlbumCollectionView.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/18.
//

import UIKit

class AlbumCollectionView: UICollectionView {

    let flowLayout = UICollectionViewFlowLayout()

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: flowLayout)
        setUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        backgroundColor = .twitter_black
        showsHorizontalScrollIndicator = false
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 78.adjusted, height: 78.adjustedH)
        flowLayout.minimumInteritemSpacing = 8
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)

        self.collectionViewLayout = flowLayout
    }
}
