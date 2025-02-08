//
//  ProfileView.swift
//  ToDo App
//
//  Created by Berkay Veysel Ayköse on 22.01.2025.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    init(){}
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user{
                    
                    Text("İsim: \(user.name)")
                    Text("Email: \(user.email)")
                    Text("Kayıt Tarihi: \(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                    
                }else{
                    Text("Porfil yüklenemedi.....")
                }
                
                BigButton(title: "Çıkış Yap", action: viewModel.logout)
                    .foregroundStyle(.red)
            }
            .navigationTitle("Profil ve ayarlar")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
