//
//  RegisterViewBuilder.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 19.10.2025.
//

import UIKit

struct RegisterViewBuilder {
    static func build(coordinator: CoordinatorProtocol) -> UIViewController {
        let authService = FirebaseAuthManager()
        let viewModel = RegisterViewModel(authService: authService)
        let loginViewController = RegisterViewController(coordinator: coordinator, viewModel: viewModel)
        
        return loginViewController
    }
        
}
