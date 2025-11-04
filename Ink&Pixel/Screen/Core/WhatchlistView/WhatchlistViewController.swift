//
//  WhatchlistViewController.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 4.11.2025.
//

import UIKit

final class WhatchlistViewController: UIViewController {
    
    // MARK: - Variable
    private var viewModel: WhatchlistViewModelProtocol
    private var coordinator: Coordinator
    
    // MARK: - UI Components
    
    // MARK: - Init
    init(coordinator: Coordinator,
         viewModel: WhatchlistViewModelProtocol) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        viewModel.delegate = self
    }
    
    // MARK: - UI Setup
    
    
}
// MARK: - Extension

// MARK: - WhatchlistViewModelDelegate
extension WhatchlistViewController: WhatchlistViewModelDelegate {
    
}

