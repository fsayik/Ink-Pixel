//
//  Coordinator.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 7.10.2025.
//

import UIKit
import FirebaseAuth


// MARK: - Coordinator
final class Coordinator: CoordinatorProtocol {
    // MARK: - Properties
    var parentCoordinator: CoordinatorProtocol?
    var children: [CoordinatorProtocol] = []
    var navigationController: UINavigationController?
    
    // MARK: - Functions
    func start() {
        if Auth.auth().currentUser?.uid != nil {
            let vc = ViewController(coordinator: self)
            navigationController?.setViewControllers([vc],
                                                     animated: true)
        } else {
            let vc = WelcomeViewController(coordinator: self)
            navigationController?.setViewControllers([vc],
                                                     animated: true)
        }
        
    }

    func eventOccurred(with viewController: UIViewController) {
        navigationController?.pushViewController(viewController,
                                                 animated: true)
    }
    
    func popView() {
        self.navigationController?.popViewController(animated: true)
    }
}
