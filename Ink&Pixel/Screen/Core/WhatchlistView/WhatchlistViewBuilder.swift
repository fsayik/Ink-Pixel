//
//  WhatchlistViewBuilder.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 4.11.2025.
//

import UIKit

struct WhatchlistViewBuilder {
    static func build(coordinator: Coordinator) -> UIViewController {
        let viewModel = WhatchlistViewModel()
        let whatchlistViewController = WhatchlistViewController(coordinator: coordinator, viewModel: viewModel)
        
        
        return whatchlistViewController
        
    }
}
