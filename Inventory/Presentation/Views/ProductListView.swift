// Mostraremos los prodcutos en el inventario 
//  ProductListView.swift
//  Inventory
//
//  Created by Andrea Torres on 12/05/25.
//

import SwiftUI
//una clase esta compuesta por atributos y metodos
struct ProductListView: View {
    //productlistviewmodel crea los productos y vamos a llamarlo para que los enseñene
    @StateObject var viewModel = ProductListViewModel()
    
    @State var showDetail = false
    @State var selectedProduct: Product? = nil
    
    var body: some View {
        NavigationStack {
            List {
                  //mostramos los elementos de una lista
                ForEach(viewModel.products) { product in
                    Text(product.name)
                        .onTapGesture {
                            selectedProduct = product
                            
                        }
                }
                .onDelete{ indexSet in
                    viewModel.deleteProduct(indexSet: indexSet)
                }
            }
            .navigationTitle("Inventory")
            .toolbar {
                ToolbarItem{
                    Button(action: {
                        showDetail = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                }
            }
            .sheet(isPresented: $showDetail) {
                ProductsDetailView{ product in
                    viewModel.addProduct(product: product)
                }
            }
            //nos dirigimos a la lista productdetailview
            .sheet(item: $selectedProduct) { selectedProduct in
                //le estamos pasando el producto seleccionado en los ()
                ProductsDetailView(selectedProduct: selectedProduct) { product in
                    viewModel.updateProduct(product: product)
                }
            }
        } //NavigationStack
    }
}
#Preview {
    ProductListView()
}
//antes de los : es nombre del parametro y dsp de : es el valor
