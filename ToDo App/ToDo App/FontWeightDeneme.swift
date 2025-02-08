//
//  FontWeightDeneme.swift
//  ToDo App
//
//  Created by Berkay Veysel Ayköse on 22.01.2025.
//

import SwiftUI

struct FontWeightDeneme: View {
    var body: some View {
        Text("black")
            .fontWeight(.black)
        
        Text("bold")
            .fontWeight(.bold)
        
        Text("heavy")
            .fontWeight(.heavy)
        
        Text("light")
            .fontWeight(.light)
        
        Text("medium")
            .fontWeight(.medium)
        
        Text("regular")
            .fontWeight(.regular)
        
        Text("semibold")
            .fontWeight(.semibold)
        
        Text("thin")
            .fontWeight(.thin)
        
        Text("ultraLight")
            .fontWeight(.ultraLight)

    }
}

#Preview {
    FontWeightDeneme()
}
