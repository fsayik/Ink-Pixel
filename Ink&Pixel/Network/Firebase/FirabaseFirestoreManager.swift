//
//  FirabaseFirestoreManager.swift
//  Ink&Pixel
//
//  Created by Ferhat Şayık on 19.10.2025.
//

import Foundation
import FirebaseFirestore

protocol FirestoreManager {
    func createUser(user: User)
}

extension FirestoreManager {
    
    func createUser(user: User) {
        let db = Firestore.firestore()
        print(user.id)
        db.collection("users")
            .document(user.id)
            .setData(user.asDictonary())
    }
}
