//
//  ContactForm.swift
//  Demo
//
//  Created by Andrea Torres on 14/04/25.
//

import SwiftUI

struct ContactForm: View {
    @State private var name = ""
    @State private var email = ""
    @State private var isSuscribe = false
    
    var body: some View {
        Form{
            Section{
                TextField("Name", text: $name)
                TextField( "Email", text: $email)
            }
            
            Section{
                Toggle("Subscribe", isOn: $isSuscribe)
            }
        }
    }
}

//Con este codigo se privisualiza
#Preview {
    ContactForm()
}
