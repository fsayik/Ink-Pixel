//
//  LoginViewBuilder.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 19.10.2025.
//

import UIKit

struct LoginViewBuilder {
    static func build(coordinator: CoordinatorProtocol) -> UIViewController {
        let authService = FirebaseAuthManager()
        let viewModel = LoginViewModel(authService: authService)
        let loginViewController = LoginViewController(coordinator: coordinator, viewModel: viewModel)
        
        return loginViewController
    }
        
}
