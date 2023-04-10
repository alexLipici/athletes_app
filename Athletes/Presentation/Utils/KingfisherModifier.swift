//
//  KingfisherModifier.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 10.04.2023.
//

import UIKit
import Kingfisher

struct KingfisherCroppedImageModifier: ImageModifier {
    func modify(_ image: UIImage) -> UIImage {
        return image.cropped(boundingBox: CGRect(
            origin: .zero,
            size: CGSize(width: image.size.width, height: image.size.width)
        )) ?? image
    }
}
