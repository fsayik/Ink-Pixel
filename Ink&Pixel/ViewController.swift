//
//  ViewController.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 6.10.2025.
//

import UIKit

class ViewController: UIViewController {
    
    var coordinator: CoordinatorProtocol
    var authService: AuthViewModelProtocol
    
    private let logout: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Out", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(coordinator: CoordinatorProtocol) {
        self.coordinator = coordinator
        authService = FirebaseAuthManager()
        super.init(nibName: nil, bundle: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        view.addSubview(logout)
        
       
        NSLayoutConstraint.activate([
            logout.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logout.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        logout.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
        
    }
    
    @objc private func handleLogout() {
        authService.logout()
        coordinator.start()
    }
}

