//
//  PetInfoCard.swift
//  Tamagotchi
//

import UIKit

final class PetInfoCard: UIView {
    // MARK: - Private properties
    private let nameLabel = UILabel()
    private let dayLabel = UILabel()
    
    private var day = 1 {
        didSet {
            dayLabel.text = "День: \(day)"
        }
    }
    
    // MARK: - Init
    init(name: String) {
        nameLabel.text = name
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setup() {
        setupSelf()
        setupNameLabel()
        setupAgeLabel()
    }
    
    private func setupSelf() {
        backgroundColor = AppColors.white
        layer.cornerRadius = 20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 8, height: 8)
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel)
        
        nameLabel.textColor = AppColors.black
        nameLabel.font = .systemFont(ofSize: 35, weight: .light)
        nameLabel.textAlignment = .center
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    private func setupAgeLabel() {
        addSubview(dayLabel)
        
        dayLabel.text = "День: \(day)"
        dayLabel.textColor = AppColors.black
        dayLabel.font = .systemFont(ofSize: 20, weight: .light)
        dayLabel.textAlignment = .center
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            dayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dayLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            dayLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25)
        ])
    }
    
    // MARK: - Public methods
    
    func increaseDay() {
        day = day + 1
    }
}
