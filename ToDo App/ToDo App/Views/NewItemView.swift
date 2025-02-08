//
//  NewItemView.swift
//  ToDo App
//
//  Created by Berkay Veysel Ayköse on 22.01.2025.
//

import SwiftUI

struct NewItemView: View {
    
    @Binding var newItemPresented : Bool
    @StateObject var viewModel = NewItemViewViewModel()
    
    var body: some View {
        VStack{
            
            Text("Yeni Görev")
                .font(.title)
                .bold()
            
            Form{
                TextField("Başlık", text: $viewModel.title)
                
                DatePicker("Bitiş Tarihi", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                BigButton(title: "Kaydet"){
                    if viewModel.canSave(){
                        viewModel.save()
                        newItemPresented = false
                    }else{
                        viewModel.showAlert = true
                    }
                    
                }.padding(10)
            }.alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Hata"), message: Text("Doğrulunu Kontrol edin."))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {return true}, set: {  _ in}))
}
