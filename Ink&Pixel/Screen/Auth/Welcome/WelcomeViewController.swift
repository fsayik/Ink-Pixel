//
//  WelcomeViewController.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 19.10.2025.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - Variable
    var coordinator: CoordinatorProtocol
    
    // MARK: - UI Components
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Social Media For Geeker"
        label.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        label.textColor = UIColor.white.withAlphaComponent(0.8)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor.white.withAlphaComponent(0.2)
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Init
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
    }
    
    // MARK: - UI Setup
    private func setupLayout() {
        view.addSubview(backgroundImageView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(createAccountButton)
        view.addSubview(signInButton)
        
        createAccountButton.addTarget(self, action: #selector(didTabCreate), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(didTabLogin), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            createAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            createAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            createAccountButton.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -16),
            createAccountButton.heightAnchor.constraint(equalToConstant: 60),
            
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            signInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            signInButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc func didTabCreate(){
        let vc =  RegisterViewBuilder.build(coordinator: coordinator)
        coordinator.eventOccurred(with: vc)
    }
    
    @objc func didTabLogin(){
        let vc = LoginViewBuilder.build(coordinator: coordinator)
        coordinator.eventOccurred(with: vc)
    }
    // MARK: - Extension
    
}
