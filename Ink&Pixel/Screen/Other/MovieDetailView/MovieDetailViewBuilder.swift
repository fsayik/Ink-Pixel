//
//  MovieDetailViewBuilder.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 8.11.2025.
//

import UIKit

struct MovieDetailViewBuilder {
    static func build(coordinator: Coordinator, movieId: Int) -> UIViewController {
        let viewModel = MovieDetailViewModel(movieId: movieId)
        let movieDetailViewController = MovieDetailViewController(coordinator: coordinator, viewModel: viewModel)
        
        
        return movieDetailViewController
        
    }
}
