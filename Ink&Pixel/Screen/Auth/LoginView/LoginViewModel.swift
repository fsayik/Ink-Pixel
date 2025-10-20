//
//  LoginViewModel.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 19.10.2025.
//

import Foundation

protocol LoginViewModelProtocol {
    
    var delegate: LoginViewModelOutputProtocol? { get set }
    
    var email: String { get set }
    var password: String { get set }
    func login(email: String, password: String)
}

protocol LoginViewModelOutputProtocol: AnyObject{
    func showAlert(message: String)
    func successLogin()
}

final class LoginViewModel: LoginViewModelProtocol {
    
    private var authService: AuthViewModelProtocol
    weak var delegate: LoginViewModelOutputProtocol?
    
    var email: String = ""
    var password: String = ""
    
    init(authService: AuthViewModelProtocol) {
        self.authService = authService
    }
    
    
    func login(email: String, password: String) {
        authService.login(email: email, password: password) { [weak self] result in
            switch result {
            case .success():
                self?.delegate?.successLogin()
            case.failure(let error):
                self?.delegate?.showAlert(message: error.localizedDescription)
            }
            
        }
    }
}
