//
//  CAGradientLayer.swift
//  Tamagotchi
//

import UIKit

extension CAGradientLayer {
    static func createGradient(with firstColor: UIColor, and secondColor: UIColor, in frame: CGRect) -> CAGradientLayer {
        let layer = Self()
        layer.frame = frame
        layer.colors = [firstColor.cgColor, secondColor.cgColor]
        layer.shouldRasterize = true
        return layer
    }
}
