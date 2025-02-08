//
//  LoginView.swift
//  ToDo App
//
//  Created by Berkay Veysel Ayköse on 22.01.2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                
                //Header - Logo
                Image("logo")
                    .resizable()
                    .ignoresSafeArea()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * (0.3), height: UIScreen.main.bounds.height * (0.3))
                
                if !viewModel.errorMessage.isEmpty{
                    Text(viewModel.errorMessage)
                        .foregroundStyle(.red)
                }
                //Form - Email ve password
                TextField("Email", text: $viewModel.email)
                    .modifier(TextFieldModifier())
                    .padding(.bottom,5)
                
                SecureField("Şifre", text: $viewModel.password)
                    .modifier(TextFieldModifier())
                
                NavigationLink("Şİfremi Unuttum", destination: RegisterView())
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.top)
                    .padding(.trailing,20)
                    .frame(maxWidth: .infinity,alignment: .trailing)
                
                BigButton(title: "Giriş Yapın", action: viewModel.login)
                    .padding(.top,50)
                
                Spacer()
                
                //Footer - Kayıt ol
                HStack{
                    Rectangle()
                        .frame(height: 0.5)
                    
                    Text("YA DA")
                    
                    Rectangle()
                        .frame(height: 0.5)

                }.foregroundStyle(.gray)
                    .padding(.horizontal,20)
                    .padding(.top)
                
                HStack{
                    Image("facebook")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                    
                    Text("Facebook ile devam et")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.systemBlue))
                }.padding(.top,10)
                
                Spacer()
                
                NavigationLink{
                    //kaydolma sayfasına git
                    RegisterView()
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
    LoginView()
}
