//
//  ImageLiteral.swift
//  Twitter-iOS
//
//  Created by 김수연 on 2022/05/16.
//

import UIKit

enum ImageLiteral {

    struct TabBar {
        static var iconHome: UIImage { .load(named: "iconHome")}
    }

}


extension UIImage {
    static func load(named imageName: String) -> UIImage {
        guard let image = UIImage(named: imageName, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = imageName
        return image
    }

    func resize(to size: CGSize) -> UIImage {
        let image = UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
        return image
    }

    static func rendering(named imageName: String) -> UIImage {
        guard let image = UIImage(named: imageName)?
            .withRenderingMode(.alwaysOriginal) else { return UIImage() }
        return image
    }
}
