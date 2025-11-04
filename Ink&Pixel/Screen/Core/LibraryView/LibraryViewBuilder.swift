//
//  LibraryViewBuilder.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 4.11.2025.
//

import UIKit

struct LibraryViewBuilder {
    static func build(coordinator: Coordinator) -> UIViewController {
        let viewModel = LibraryViewModel()
        let libraryViewController = LibraryViewController(coordinator: coordinator, viewModel: viewModel)
        
        
        return libraryViewController
        
    }
}
