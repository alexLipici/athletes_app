//
//  UIImage+Extension.swift
//  Athlets
//
//  Created by Petru-Alexandru Lipici on 10.04.2023.
//

import UIKit

extension UIImage {
    func cropped(boundingBox: CGRect) -> UIImage? {
        guard let cgImage = self.cgImage?.cropping(to: boundingBox) else {
            return nil
        }
        
        return UIImage(cgImage: cgImage)
    }
}
