//
//  PetDescriptionCard.swift
//  Tamagotchi
//

import UIKit

final class PetDescriptionCard: UIView {
    // MARK: - Private properties
    
    private let happinessLabel = UILabel()
    private let healthLabel = UILabel()
    private let sleepLabel = UILabel()
    
    private let happinessStatus = StatusBar(filledImage: UIImage(named: "filledCircle")!,
                                            unfilledImage: UIImage(named: "unfilledCircle")!)
    private let healthStatus = StatusBar(filledImage: UIImage(named: "filledHeart")!,
                                         unfilledImage: UIImage(named: "unfilledHeart")!)
    private let sleepStatus = StatusBar(filledImage: UIImage(named: "filledTriangle")!,
                                        unfilledImage: UIImage(named: "unfilledTriangle")!)
    
    private var happiness = 3
    private var health = 3
    private var sleep = 3
    
    
    // MARK: - Init
    init(){
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupSelf()
        setupHappinessLabel()
        setupHealthLabel()
        setupSleepLabel()
        setupHappinessStatus()
        setupHealthStatus()
        setupSleepStatus()
    }
    
    private func setupSelf() {
        layer.cornerRadius = 20
        layer.backgroundColor = AppColors.white.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.25
        layer.shadowOffset = CGSize(width: 8, height: 8)
    }
    
    private func setupHappinessLabel() {
        addSubview(happinessLabel)
        happinessLabel.translatesAutoresizingMaskIntoConstraints = false
        happinessLabel.text = "Счастье"
        happinessLabel.font = .systemFont(ofSize: 12, weight: .regular)
        happinessLabel.textColor = AppColors.black
        
        NSLayoutConstraint.activate([
            happinessLabel.topAnchor.constraint(equalTo: topAnchor, constant: 18),
            happinessLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
        ])
    }
    
    private func setupHealthLabel() {
        addSubview(healthLabel)
        healthLabel.translatesAutoresizingMaskIntoConstraints = false
        healthLabel.text = "Здоровье"
        healthLabel.font = .systemFont(ofSize: 12, weight: .regular)
        healthLabel.textColor = AppColors.black
        
        NSLayoutConstraint.activate([
            healthLabel.topAnchor.constraint(equalTo: happinessLabel.bottomAnchor, constant: 15),
            healthLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
        ])
    }
    
    private func setupSleepLabel() {
        addSubview(sleepLabel)
        sleepLabel.translatesAutoresizingMaskIntoConstraints = false
        sleepLabel.text = "Сон"
        sleepLabel.font = .systemFont(ofSize: 12, weight: .regular)
        sleepLabel.textColor = AppColors.black
        
        NSLayoutConstraint.activate([
            sleepLabel.topAnchor.constraint(equalTo: healthLabel.bottomAnchor, constant: 15),
            sleepLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            sleepLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18)
        ])
    }
    
    private func setupHappinessStatus() {
        addSubview(happinessStatus)
        happinessStatus.translatesAutoresizingMaskIntoConstraints = false
        happinessStatus.setState(amount: happiness)
        NSLayoutConstraint.activate([
            happinessStatus.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            happinessStatus.centerYAnchor.constraint(equalTo: happinessLabel.centerYAnchor)
        ])
    }
    
    private func setupHealthStatus() {
        addSubview(healthStatus)
        healthStatus.translatesAutoresizingMaskIntoConstraints = false
        healthStatus.setState(amount: health)
        NSLayoutConstraint.activate([
            healthStatus.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            healthStatus.centerYAnchor.constraint(equalTo: healthLabel.centerYAnchor)
        ])
    }
    
    private func setupSleepStatus() {
        addSubview(sleepStatus)
        sleepStatus.setState(amount: sleep)
        sleepStatus.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sleepStatus.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            sleepStatus.centerYAnchor.constraint(equalTo: sleepLabel.centerYAnchor)
        ])
    }
    
    // MARK: - Public methods
    
    func increaseHappiness() {
        happiness = min(5, happiness + 2)
        sleep = max(0, sleep - 1)
        health = max(0, health - 1)
        updateStates()
    }
    
    func increaseHealth() {
        health = min(5, health + 2)
        sleep = max(0, sleep - 1)
        happiness = max(0, happiness - 1)
        updateStates()
    }
    
    func increaseSleep() {
        sleep = min(5, sleep + 2)
        health = max(0, health - 1)
        happiness = max(0, happiness - 1)
        updateStates()
    }
    
    func updateStates() {
        guard happiness > 0, health > 0, sleep > 0 else {
            NotificationCenter.default.post(name: Notification.Name("NotificationIdentifier"), object: nil)
            return
        }
        happinessStatus.setState(amount: happiness)
        healthStatus.setState(amount: health)
        sleepStatus.setState(amount: sleep)
    }
    

    
}
