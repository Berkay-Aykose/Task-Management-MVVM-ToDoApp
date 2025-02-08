//
//  LoginViewModel.swift
//  ToDo App
//
//  Created by Berkay Veysel Ayköse on 22.01.2025.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel : ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
    }

    func validate() -> Bool{
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Lütfen giriş yapmak için bilgilerinizi giriniz!"
            return false
        }
        
        guard email.contains("@") && email.contains(".")
        else {
            errorMessage = "Lütfen geçerli bir email adresi giriniz!"
            return false
        }
        
        return true
    }
    
}
