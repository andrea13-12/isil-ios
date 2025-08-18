//
//  ContactDetailView.swift
//  Agenda
//
//  Created by Andrea Torres on 21/04/25.
//

import SwiftUI
struct ContactDetailView: View {
    
    @State var name = ""
    @State var phone = ""
    @State var company = ""
    @Environment(\.dismiss) var dismiss //cierra la vista donde me encuentro
    
    var editingContact: Contact? //? = puede ser null
    var title : String {
        editingContact == nil ? "New Contact" : "Edit Contact"
    }
    
    @ObservedObject var ViewModel: ContactListViewModel
    
    var body: some View {
        NavigationStack {
            Form{
                Section {
                    TextField("Name", text: $name)
                    TextField("Phone", text: $phone)
                    TextField("Company", text: $company)
                }
            }//from
            .navigationTitle(title)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button(action:{
                        let id = editingContact?.id ?? UUID() 
                        let contact = Contact(id: id,
                                              name: name,
                                              phone: phone,
                                              company: company)
                        ViewModel.saveContact(contact: contact, editing: editingContact != nil)
                        dismiss()
                    }) {
                        Text("Save")
                    }
                }
            }//tollbar
            .onAppear(){
                if let contact = editingContact{
                    name = contact.name
                    phone = contact.phone
                    company = contact.company
                }
            }
        }//NavigationStack
    } //body
}

#Preview {
    ContactDetailView(ViewModel: ContactListViewModel())
}
