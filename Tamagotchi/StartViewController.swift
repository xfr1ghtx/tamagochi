//
//  ViewController.swift
//  Tamagotchi
//

import UIKit

final class StartViewController: UIViewController {
    // MARK: - Private properties
    private let label = UILabel()
    private let avatarPicker = AvatarPicker()
    private let textField = CustomTextField()
    private let createButton = UIButton(type: .system)

    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        let gradient = CAGradientLayer.createGradient(with: AppColors.pink, and: AppColors.lightBlue, in: view.bounds)
        view.layer.addSublayer(gradient)
        super.viewDidLoad()
    }
    
    //MARK: Init
    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Setup
    private func setup() {
        setupLabel()
        setupAvatarPicker()
        setupTextField()
        setupCreateButton()
    }
    
    private func setupLabel() {
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = AppColors.white
        label.font = .systemFont(ofSize: 35, weight: .light)
        label.text = "Дайте имя \n вышему питомцу"
        label.numberOfLines = 0
        label.textAlignment = .center
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupAvatarPicker() {
        view.addSubview(avatarPicker)
        
        avatarPicker.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarPicker.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 80),
            avatarPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupTextField() {
        view.addSubview(textField)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: avatarPicker.bottomAnchor, constant: 80),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42)
        ])
    }
    
    private func setupCreateButton() {
        view.addSubview(createButton)
        
        createButton.setTitle("Создать", for: .normal)
        createButton.setTitleColor(AppColors.lightBlue, for: .normal)
        createButton.titleLabel?.font = .systemFont(ofSize: 35, weight: .light)
        createButton.backgroundColor = AppColors.white
        createButton.layer.cornerRadius = 20
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.addTarget(self, action: #selector(tapOnCreateButton), for: .touchUpInside)
        createButton.layer.shadowColor = UIColor.black.cgColor
        createButton.layer.shadowRadius = 10
        createButton.layer.shadowOpacity = 0.25
        createButton.layer.shadowOffset = CGSize(width: 8, height: 8)
        
        NSLayoutConstraint.activate([
            createButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 60),
            createButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            createButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            createButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    // MARK: - Actions
    
    @objc
    private func tapOnCreateButton(){
        guard let text = textField.text, !text.isEmpty else {
            let alert = UIAlertController(title: "Ууупс", message: "Кажется вы забыли ввести имя", preferredStyle: .alert)
            alert.addAction(.init(title: "Ок", style: .default))
            present(alert, animated: true)
            return
        }
        
        let vc = GameViewController(image: avatarPicker.image, name: text)
        navigationController?.pushViewController(vc, animated: true)
    }

}
