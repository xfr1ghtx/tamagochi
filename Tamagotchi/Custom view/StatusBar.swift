//
//  StatusBar.swift
//  Tamagotchi
//

import UIKit

final class StatusBar: UIView {
    //MARK: - Private properties
    private let container = UIStackView()
    private let filledImage: UIImage
    private let unfilledImage: UIImage
    
    //MARK: - Init
    
    init(filledImage: UIImage, unfilledImage: UIImage) {
        self.filledImage = filledImage
        self.unfilledImage = unfilledImage
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public methods {
    func setState(amount: Int){
        let allImage = container.arrangedSubviews
        
        allImage.forEach {
            guard let imageView = $0 as? UIImageView else { return }
            imageView.image = unfilledImage
        }
        
        for i in 0..<amount {
            guard let imageView = allImage[i] as? UIImageView else { return }
            imageView.image = filledImage
        }
    }
    
    //MARK: - Setup
    
    private func setup() {
        addSubview(container)
        container.axis = .horizontal
        container.translatesAutoresizingMaskIntoConstraints = false
        container.spacing = 6
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        for _ in 1...5{
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
            imageView.image = unfilledImage
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: 18),
                imageView.heightAnchor.constraint(equalToConstant: 18)
            ])
            container.addArrangedSubview(imageView)
        }
    }
}
