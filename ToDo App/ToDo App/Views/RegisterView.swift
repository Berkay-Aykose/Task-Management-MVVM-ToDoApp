//
//  RegisterView.swift
//  ToDo App
//
//  Created by Berkay Veysel Ayköse on 22.01.2025.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                
                Image("logo")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * (0.3), height: UIScreen.main.bounds.height * (0.3))
                
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                }
                
                TextField("İsim", text: $viewModel.name)
                    .modifier(TextFieldModifier())
                    .padding(.bottom,5)
                
                TextField("Email", text: $viewModel.email)
                    .modifier(TextFieldModifier())
                    .padding(.bottom,5)
                
                SecureField("Şifre", text: $viewModel.password)
                    .modifier(TextFieldModifier())
                    .padding(.bottom,5)
                
                BigButton(title: "Kaydolun", action: viewModel.register)
                    .padding(.top,50)
                
                Spacer()
                
                NavigationLink{
                    //kaydolma sayfasına git
                    LoginView()
                        .navigationBarBackButtonHidden(true)
                }label: {
                    HStack{
                        Text("Zaten üye misiniz?")
                            .foregroundStyle(Color(.black))
                        
                        Text("Giriş Yapın")
                            .fontWeight(.semibold)
                    }
                }.padding(.vertical,20)
            }
        }
    }
}

#Preview {
    RegisterView()
}
