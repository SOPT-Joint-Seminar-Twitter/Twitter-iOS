//
//  MyPhoto.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/18.
//

import Foundation
import UIKit

struct MyPhoto {
    let imageName: String

    func makeAlbumImage() -> UIImage? {
        return UIImage(named: imageName)
    }
}

extension MyPhoto {
    static let dummy: [MyPhoto] = [
        MyPhoto(imageName: "imgProfile2"),
        MyPhoto(imageName: "imgProfile3"),
        MyPhoto(imageName: "imgProfile4"),
        MyPhoto(imageName: "imgProfile5"),
        MyPhoto(imageName: "imgProfile6")
    ]
}
