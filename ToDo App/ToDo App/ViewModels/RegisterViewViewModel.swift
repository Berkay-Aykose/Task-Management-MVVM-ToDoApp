//
//  RegisterViewModel.swift
//  ToDo App
//
//  Created by Berkay Veysel Ayköse on 22.01.2025.
//

import FirebaseAuth
import Foundation
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func register(){
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){ [weak self] result , error in
            guard let userId = result?.user.uid else{
                return
            }
            
            //insert metodu çağıralacak
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
    
    private func validate() -> Bool{
        
        errorMessage = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !name.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Lütfen giriş yapmak için bilgilerinizi giriniz!"
            return false
        }
        
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Lütfen geçerli bir email adresi giriniz!"
            return false
        }
        
        guard password.count >= 8 else {
            errorMessage = "Lütfen 8 ve daha fazla karakterli şifre giriniz."
            return false
        }
        
        return true
    }
}
