//
//  AvatarPicker.swift
//  Tamagotchi
//

import UIKit

class AvatarPicker: UIView {
    // MARK: - Public properties
    
    var image: UIImage {
        get {
            return imageView.image!
        }
    }
    
    // MARK: - Private properties
    private let imageView = UIImageView()
    private let backArrow = UIButton()
    private let nextArrow = UIButton()
    
    private let images = AvatarImageFactory.getStandartImages()
    private var imageIndex = 0
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        setupImageView()
        setupBackArrow()
        setupNextArrow()
    }
    
    private func setupImageView() {
        addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = AppColors.white
        imageView.contentMode = .scaleAspectFit
        imageView.image = images.first
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowRadius = 10
        imageView.layer.shadowOpacity = 0.25
        imageView.layer.shadowOffset = CGSize(width: 8, height: 8)
        imageView.layer.cornerRadius = 100
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setupBackArrow() {
        addSubview(backArrow)
        
        backArrow.isHidden = true
        backArrow.translatesAutoresizingMaskIntoConstraints = false
        backArrow.backgroundColor = .clear
        backArrow.setImage(UIImage(named: "backArrow"), for: .normal)
        backArrow.addTarget(self, action: #selector(previousImage), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            backArrow.widthAnchor.constraint(equalToConstant: 40),
            backArrow.heightAnchor.constraint(equalToConstant: 40),
            backArrow.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            backArrow.trailingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: -16),
            backArrow.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    private func setupNextArrow() {
        addSubview(nextArrow)
        
        nextArrow.isHidden = false
        nextArrow.translatesAutoresizingMaskIntoConstraints = false
        nextArrow.backgroundColor = .clear
        nextArrow.setImage(UIImage(named: "nextArrow"), for: .normal)
        nextArrow.addTarget(self, action: #selector(nextImage), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            nextArrow.widthAnchor.constraint(equalToConstant: 40),
            nextArrow.heightAnchor.constraint(equalToConstant: 40),
            nextArrow.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            nextArrow.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16),
            nextArrow.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    // MARK: - Actions
    @objc
    private func nextImage() {
        imageIndex = images.index(after: imageIndex)
        imageView.image = images[imageIndex]
        
        if imageIndex == images.count - 1 {
            nextArrow.isHidden = true
            
        } else if imageIndex == 1 {
            backArrow.isHidden = false
        }
    }
    
    @objc
    private func previousImage() {
        imageIndex = images.index(before: imageIndex)
        imageView.image = images[imageIndex]
        
        if imageIndex == 0 {
            backArrow.isHidden = true
            
        } else if imageIndex == images.count - 2 {
            nextArrow.isHidden = false
        }
    }
}
