//
//  HomeViewBuilder.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 4.11.2025.
//

import UIKit

struct HomeViewBuilder {
    static func build(coordinator: Coordinator) -> UIViewController {
        let viewModel = HomeViewModel()
        let homeViewController = HomeViewController(coordinator: coordinator, viewModel: viewModel)
        
        
        return homeViewController
        
    }
}
