//
//  SwiftUIView.swift
//  Demo
//
//  Created by Andrea Torres on 14/04/25.
//

import SwiftUI

struct Profilecard: View {
    var body: some View {
        VStack (spacing:16){
            
            Image(systemName: "person.circle.fill")
                .resizable().frame(width:100,
                                 height:100)
                    .foregroundStyle(.blue)
            
            Text("Andrea Torres")
                .font(.title)
                .bold()
            
            Text("Estudiante a tiempo completo")
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(24)
        .shadow(radius: 8)
    }
}

#Preview {
    Profilecard()
}
