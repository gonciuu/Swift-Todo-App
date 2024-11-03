//
//  RegisterViewModel.swift
//  Todo app
//
//  Created by Kacper Wojak on 19/10/2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class RegisterViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error {
                self?.errorMessage = error.localizedDescription
                return
            }
            
            guard let user = result?.user else {
                self?.errorMessage = "Something went wrong"
                return
            }
            
            self?.insertUser(userId: user.uid)
        }
    }
    
    private func insertUser(userId: String) {
        let user = User(id: userId, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        
        db.collection("users").document(userId).setData(user.asDictionary())
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "All fields are required"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Invalid email"
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Password is too weak"
            return false
        }
        
        return true
    }
}
