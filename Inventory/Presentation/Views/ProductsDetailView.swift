// Aqui mostraremos los detalles de los productos

//  ProductsDetailView.swift
//  Inventory
//
//  Created by Andrea Torres on 12/05/25.
//

import SwiftUI

//colocamos stado el nombre porq va a variar (c/product tiene su nombre

struct ProductsDetailView: View {
    //importamos el productdetailviewmodel
    @StateObject var viewModel = ProductDetailViewModel()
        //salimos de una vista
    @Environment(\.dismiss) var dismiss
    
    var title:String {
        selectedProduct == nil ? "New product" : "Update product"
    }
    var selectedProduct: Product?     //puede ser que no llegue ningun producto
    var onSave: (Product) -> Void

    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Name", text: $viewModel.name)
                        .autocorrectionDisabled()
                    TextField("Quantity", text: $viewModel.quantity)
                        .keyboardType(.numberPad)
                }
                
                Section{
                    Button(action: {
                        if let product = viewModel.validate(id: selectedProduct?.id) {
                            onSave(product)
                            dismiss()
                        }
                        //validamos si el producto esta en el viewmodel
                    }) {
                        Text("Save")
                    }
                }
                Group{
                    if let error = viewModel.errorMessage{
                        Text(error).foregroundStyle(.red)
                    }
                }
            }
            .navigationTitle(title)
            .onAppear{
                viewModel.loadData(product: selectedProduct)
            }
        }
    }
}

#Preview {
    ProductsDetailView{_ in}
}

