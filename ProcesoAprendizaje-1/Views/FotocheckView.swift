//
//  Fotocheck.swift
//  ProcesoAprendizaje-1
//
//  Created by Andrea Torres on 1/05/25.
//

import SwiftUI

struct FotocheckView: View {
    var persona: Personas
    
    var body: some View {
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable().frame(width:100,
                                 height:100)
                    .foregroundStyle(.purple)

            Text(persona.name)
                .font(.title)
                .bold()
            
            Text(persona.cargo)
                .font(.title2)
                .foregroundStyle(.gray)
            
            Text(persona.empresa)
                .font(.subheadline)
                .foregroundStyle(.gray)
            
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(24)
        .shadow(radius: 8)
    }
}

