//
//  WritingViewController+Extesion.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/18.
//

import UIKit

extension SuYeonWritingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as IconCollectionViewCell
            cell.render(type: .sound)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as IconCollectionViewCell
            cell.render(type: .camera)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as ImageCollectionViewCell
            cell.update(data: MyPhoto.dummy[indexPath.row - 2])
            return cell
        }
    }
}
