//
//  CustomTextField.swift
//  Tamagotchi
//

import UIKit

final class CustomTextField: UITextField {
    // MARK: - Private properties
    
    private let line = UIView()
    
    // MARK: - Init
    init(){
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        setupTextField()
        setupLine()
    }
    
    private func setupTextField() {
        textAlignment = .center
        font = .systemFont(ofSize: 25, weight: .light)
        textColor = AppColors.white
        attributedPlaceholder = NSAttributedString(
            string: "Введите имя здесь",
            attributes: [NSAttributedString.Key.foregroundColor: AppColors.white]
        )
    }
    
    private func setupLine() {
        addSubview(line)
        
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = AppColors.white
        
        NSLayoutConstraint.activate([
            line.heightAnchor.constraint(equalToConstant: 2),
            line.topAnchor.constraint(equalTo: bottomAnchor),
            line.leadingAnchor.constraint(equalTo: leadingAnchor),
            line.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
