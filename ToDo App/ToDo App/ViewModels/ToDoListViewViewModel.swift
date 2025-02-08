//
//  ToDoListViewModel.swift
//  ToDo App
//
//  Created by Berkay Veysel Ayköse on 22.01.2025.
//

import Foundation
import FirebaseFirestore

class ToDoListViewViewModel:ObservableObject{
     
    @Published var showingNewItemView = false
    private let userId : String
    
    init(userId:String){
        self.userId = userId
    }
    
    func delete(id:String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
            
    }
    
}
