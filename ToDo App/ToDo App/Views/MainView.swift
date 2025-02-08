//
//  ContentView.swift
//  ToDo App
//
//  Created by Berkay Veysel Ayköse on 22.01.2025.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        
        if viewModel.isSignedIn, !viewModel.currenUserId.isEmpty {
            TabView{
                ToDoListView(userId: viewModel.currenUserId)
                    .tabItem{
                        Label("Planlarım", systemImage: "calendar")
                    }
                ProfileView()
                    .tabItem{
                        Label("Profilim", systemImage: "person.fill")
                    }
            }
        }else{
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
