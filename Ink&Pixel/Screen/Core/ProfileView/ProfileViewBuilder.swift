//
//  ProfileViewBuilder.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 4.11.2025.
//

import UIKit

struct ProfileViewBuilder {
    static func build(coordinator: Coordinator) -> UIViewController {
        let viewModel = ProfileViewModel()
        let profileViewController = ProfileViewController(coordinator: coordinator, viewModel: viewModel)
        
        
        return profileViewController
        
    }
}
