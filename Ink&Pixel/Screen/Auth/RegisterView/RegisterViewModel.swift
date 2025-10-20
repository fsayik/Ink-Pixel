//
//  RegisterViewModel.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 19.10.2025.
//

import Foundation

protocol RegisterViewModelProtocol {
    var delegate: RegisterViewModelOuputProtocol? { get set }
    
    var name: String { get set }
    var email: String { get set }
    var password: String { get set }
    func register(name: String, email: String, password: String)
}

protocol RegisterViewModelOuputProtocol: AnyObject {
    func showAlert(message: String)
    func successRegister()
}

final class RegisterViewModel: RegisterViewModelProtocol {
    
    private var authService: AuthViewModelProtocol
    weak var delegate: RegisterViewModelOuputProtocol?
    
    var name: String = ""
    var email: String = ""
    var password: String = ""
    
    init(authService: AuthViewModelProtocol) {
        self.authService = authService
    }
    
    func register(name: String, email: String, password: String) {
        authService.register(name: name, email: email, password: password) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                print("Succes")
                delegate?.successRegister()
            case .failure(let error):
                delegate?.showAlert(message: error.localizedDescription)
            }
        }
    }
    
}
