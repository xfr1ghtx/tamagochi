//
//  GameViewController.swift
//  Tamagotchi
//

import UIKit

final class GameViewController: UIViewController {
    // MARK: - Private properties
    private let imageView = UIImageView()
    private let petInfo: PetInfoCard
    private let petDescription = PetDescriptionCard()
    private let buttonContainer = UIStackView()
    private let happinessButton = UIButton()
    private let healthButton = UIButton()
    private let sleepButton = UIButton()
    
    // MARK: - Init
    init(image: UIImage, name: String) {
        petInfo = PetInfoCard(name: name)
        imageView.image = image
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        petInfo = PetInfoCard(name: "Хитсёнок")
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradient = CAGradientLayer.createGradient(with: AppColors.pink, and: AppColors.lightBlue, in: view.bounds)
        view.layer.addSublayer(gradient)
        NotificationCenter.default.addObserver(self, selector: #selector(yourAnimalIsDead), name: Notification.Name("NotificationIdentifier"), object: nil)
    }
    
    // MARK: - Setup
    private func setup() {
        setupImageView()
        setupPetInfo()
        setupPetDescription()
        setupButtonContainer()
        setupHappinessButton()
        setupHealthButton()
        setupSleepButton()
    }
    
    private func setupImageView() {
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = AppColors.white
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 100
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowRadius = 10
        imageView.layer.shadowOpacity = 0.25
        imageView.layer.shadowOffset = CGSize(width: 8, height: 8)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupPetInfo() {
        view.addSubview(petInfo)
        
        petInfo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            petInfo.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            petInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            petInfo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
        ])
    }
    
    private func setupPetDescription() {
        view.addSubview(petDescription)
        
        petDescription.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            petDescription.topAnchor.constraint(equalTo: petInfo.bottomAnchor, constant: 30),
            petDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            petDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48)
        ])
    }
    
    private func setupButtonContainer() {
        view.addSubview(buttonContainer)
        buttonContainer.alignment = .fill
        buttonContainer.distribution = .fillProportionally
        buttonContainer.spacing = 25
        buttonContainer.translatesAutoresizingMaskIntoConstraints = false
        buttonContainer.axis = .horizontal
        NSLayoutConstraint.activate([
            buttonContainer.topAnchor.constraint(equalTo: petDescription.bottomAnchor, constant: 50),
            buttonContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 48),
            buttonContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -48),
            buttonContainer.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupHappinessButton() {
        happinessButton.backgroundColor = AppColors.white
        happinessButton.layer.cornerRadius = 10
        happinessButton.setTitle("Счастье", for: .normal)
        happinessButton.setTitleColor(AppColors.black, for: .normal)
        happinessButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        happinessButton.layer.shadowColor = UIColor.black.cgColor
        happinessButton.layer.shadowRadius = 5
        happinessButton.layer.shadowOpacity = 0.25
        happinessButton.layer.shadowOffset = CGSize(width: 8, height: 8)
        happinessButton.addTarget(self, action: #selector(tapOnHappiness), for: .touchUpInside)
        buttonContainer.addArrangedSubview(happinessButton)
    }
    
    private func setupHealthButton() {
        healthButton.backgroundColor = AppColors.white
        healthButton.layer.cornerRadius = 10
        healthButton.setTitle("Здоровье", for: .normal)
        healthButton.setTitleColor(AppColors.black, for: .normal)
        healthButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        healthButton.layer.shadowColor = UIColor.black.cgColor
        healthButton.layer.shadowRadius = 5
        healthButton.layer.shadowOpacity = 0.25
        healthButton.layer.shadowOffset = CGSize(width: 8, height: 8)
        healthButton.addTarget(self, action: #selector(tapOnHealth), for: .touchUpInside)
        buttonContainer.addArrangedSubview(healthButton)
    }
    
    private func setupSleepButton() {
        sleepButton.backgroundColor = AppColors.white
        sleepButton.layer.cornerRadius = 10
        sleepButton.setTitle("Сон", for: .normal)
        sleepButton.setTitleColor(AppColors.black, for: .normal)
        sleepButton.titleLabel?.font = .systemFont(ofSize: 12, weight: .regular)
        sleepButton.layer.shadowColor = UIColor.black.cgColor
        sleepButton.layer.shadowRadius = 5
        sleepButton.layer.shadowOpacity = 0.25
        sleepButton.layer.shadowOffset = CGSize(width: 8, height: 8)
        sleepButton.addTarget(self, action: #selector(tapOnSleep), for: .touchUpInside)
        buttonContainer.addArrangedSubview(sleepButton)
    }
    
    // MARK: - Actions
    
    @objc
    private func yourAnimalIsDead() {
        let alert = UIAlertController(title: "Ууупс", message: "Кажется ваше животное умерло", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Помянем", style: .default, handler: { [weak self] _ in
            self?.navigationController?.popToRootViewController(animated: true)
        }))
        present(alert, animated: true)
    }
    
    @objc
    private func tapOnHappiness() {
        petDescription.increaseHappiness()
        petInfo.increaseDay()
    }
    
    @objc
    private func tapOnHealth() {
        petDescription.increaseHealth()
        petInfo.increaseDay()
    }
    
    @objc
    private func tapOnSleep() {
        petDescription.increaseSleep()
        petInfo.increaseDay()
    }
}
