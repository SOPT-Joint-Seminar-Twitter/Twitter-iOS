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

    struct Writing {
        static var iconCamera: UIImage { .load(named: "iconCamera")}
        static var iconChart: UIImage { .load(named: "iconChart")}
        static var iconCircle: UIImage { .load(named: "iconCircle")}
        static var iconEarth: UIImage { .load(named: "iconEarth")}
        static var iconGif: UIImage { .load(named: "iconGif")}
        static var iconImage: UIImage { .load(named: "iconImage")}
        static var iconLocation: UIImage { .load(named: "iconLocation")}
        static var iconPlus: UIImage { .load(named: "iconPlus")}
        static var iconSound: UIImage { .load(named: "iconSound")}
        static var iconMoreBtn: UIImage { .load(named: "iconMoreButton")}
        static var iconShareBtn: UIImage { .load(named: "iconShareButton")}
        static var iconBigPlus: UIImage { .load(named: "iconBigPlus")}

        static var imgCircleProfile: UIImage { .load(named: "imgCircleProfile")}
        static var imgProfile1: UIImage { .load(named: "imgProfile1")}
        static var imgProfile2: UIImage { .load(named: "imgProfile2")}
        static var imgProfile3: UIImage { .load(named: "imgProfile3")}
        static var imgProfile4: UIImage { .load(named: "imgProfile4")}
        static var imgProfile5: UIImage { .load(named: "imgProfile5")}
        static var imgProfile6: UIImage { .load(named: "imgProfile6")}
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
