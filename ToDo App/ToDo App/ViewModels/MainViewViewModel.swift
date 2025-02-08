//
//  MainViewModel.swift
//  ToDo App
//
//  Created by Berkay Veysel Ayköse on 22.01.2025.
//

import Foundation
import FirebaseAuth

class MainViewViewModel : ObservableObject{
    
    @Published var currenUserId : String = ""
    
    init() {
        Auth.auth().addStateDidChangeListener{ [weak self] _,user in
            DispatchQueue.main.async{
                self?.currenUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool{
        return Auth.auth().currentUser != nil
    }
}
