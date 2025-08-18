//
//  ContacFrom.swift
//  ProcesoAprendizaje-1
//
//  Created by Andrea Torres on 1/05/25.
//

import SwiftUI

struct RegistroFrom: View {
    @State private var name: String = ""
    @State private var cargo: String = ""
    @State private var empresa: String = ""
    @State private var mostrarFotocheck = false

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Nombre Completo", text: $name)
                    TextField("Cargo", text: $cargo)
                    TextField("Empresa", text: $empresa)
                }

                Button("Generar fotocheck") {
                    mostrarFotocheck = true
                }
            }
            .navigationDestination(isPresented: $mostrarFotocheck) {
                let persona = Personas(name: name, cargo: cargo, empresa: empresa)
                FotocheckView(persona: persona)
            }
            .navigationTitle("Registrase")
        }
    }
}
#Preview {
    RegistroFrom()
}
