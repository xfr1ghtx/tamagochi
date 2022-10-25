//
//  AvatarImageFactory.swift
//  Tamagotchi
//

import UIKit

final class AvatarImageFactory {
    static func getStandartImages() -> [UIImage] {
        var images: [UIImage] = []
        
        images.append(UIImage(named: "Bear")!)
        images.append(UIImage(named: "Cat")!)
        images.append(UIImage(named: "Chicken")!)
        images.append(UIImage(named: "Deer")!)
        images.append(UIImage(named: "Dog")!)
        images.append(UIImage(named: "Elephant")!)
        images.append(UIImage(named: "Horse")!)
        images.append(UIImage(named: "Lion")!)
        images.append(UIImage(named: "Monkey")!)
        images.append(UIImage(named: "Otter")!)
        images.append(UIImage(named: "Panda")!)
        images.append(UIImage(named: "Piggy")!)
        images.append(UIImage(named: "Rabbit")!)
        images.append(UIImage(named: "Raccon")!)
        images.append(UIImage(named: "Tiger")!)
        
        return images
    }
}
