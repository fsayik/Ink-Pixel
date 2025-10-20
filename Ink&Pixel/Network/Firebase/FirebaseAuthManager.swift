//
//  FirebaseAuthManager.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 19.10.2025.
//

import Foundation
import FirebaseAuth

protocol AuthViewModelProtocol {
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
    func register(name: String, email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void)
    func logout()
}

final class FirebaseAuthManager: AuthViewModelProtocol, FirestoreManager {
    
   
    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    func register(name: String, email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(.failure(error))
            } else {
                guard let userID = result?.user.uid else {
                    return
                }
                let user = User(id: userID, email: email, name: name, joined: Date().timeIntervalSince1970)
                self.createUser(user: user)
                completion(.success(()))
            }
        }
        
        
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Logout failed: \(error.localizedDescription)")
        }
    }
    
}
