//
//  SwiftUIView.swift
//  Agenda
//
//  Created by Andrea Torres on 21/04/25.
//

import SwiftUI

struct ContactsListView: View {
    @StateObject private var viewModel = ContactListViewModel()
    @State private var showContactDetail = false
    @State private var selecteContact: Contact? = nil //que no he selecionado ningun contacto al inicio
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.contacts) { contact in
                    Text(contact.name)
                        .onTapGesture {
                            selecteContact = contact //ya tiene un valor
                            showContactDetail = true
                        }
                }//foreach
                .onDelete {
                    indexSet in
                    viewModel.deleteContact (at : indexSet)
                } //ondelete
            }
            .navigationTitle(Text("Agenda"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        selecteContact = nil //aqui decimos que no ha seleccionado un contacto
                        showContactDetail = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showContactDetail) {
                ContactDetailView(
                    editingContact: selecteContact,
                    ViewModel: viewModel)
            }
        }
    }
}
    
    #Preview {
        ContactsListView()
    }
