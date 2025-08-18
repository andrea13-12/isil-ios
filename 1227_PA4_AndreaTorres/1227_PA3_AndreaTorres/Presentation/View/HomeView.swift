//
//  HomeView.swift
//  1227_PA3_AndreaTorres
//
//  Created by Andrea Torres on 10/06/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var search = ""
    
    @State var deliveryAddress = "7491 Elm Street, Springfield"
    @State var hasNotifications = false
    let categories = ["All","Fashion", "Jewelry", "Electronics"]
    
    @State var selectedCategory = "All"
    
    @StateObject var viewModel = HomeViewModel()
    
    @State var selectedProduct: Product? = nil
    
    var body: some View {
        ScrollView{
            VStack (spacing: UIConstants.spacingDefault){
                HStack {
                    HStack(spacing: 4) {
                        Image(systemName: "location")
                            .foregroundStyle(.gray)
                            .font(.caption)
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Delivery address")
                                .font(.caption)
                                .foregroundStyle(.gray)
                            HStack(spacing: 4) {
                                Text(deliveryAddress)
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .lineLimit(1)
                                Image(systemName: "chevron.down")
                                    .font(.caption2)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    
                    Spacer()
                    HStack(spacing: 16) {
                        Button {
                            
                        } label: {
                            Image(systemName: "message")
                                .font(.title3)
                                .foregroundStyle(.black)
                        }
                        Button {
                        } label: {
                            ZStack {
                                Image(systemName: "bell")
                                    .font(.title3)
                                    .foregroundStyle(.black)
                                if hasNotifications {
                                    Circle()
                                        .fill(.red)
                                        .frame(width: 8, height: 8)
                                        .offset(x: 8, y: -8)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
                //search
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray )
                    TextField("Search", text: $search)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                }
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: UIConstants.cornerRadiusSmall))
                
                Banner()
                
                ScrollView (.horizontal) {
                    HStack {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                                .padding(.horizontal, UIConstants.paddingLarge)
                                .padding(.vertical, UIConstants.paddingDefault)
                                .background(category == selectedCategory ? ColorPalette.primary : .white)
                                .foregroundStyle(category == selectedCategory ? .white : .gray)
                                .clipShape(RoundedRectangle(cornerRadius: UIConstants.cornerRadiusDefault))
                                .overlay {
                                    RoundedRectangle(cornerRadius: UIConstants.cornerRadiusDefault)
                                        .stroke(category == selectedCategory ? ColorPalette.primary : .gray, lineWidth: 1)
                                }
                                .onTapGesture {
                                    selectedCategory = category
                                }
                        }
                    }
                }
                
                //CardView
                
                switch viewModel.state {
                case .idle, .loading:
                    ProgressView("Loading")
                case .success(let products):
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(products) { product in
                            ProductCardView(product: product)
                                .onTapGesture {
                                    selectedProduct = product
                                }
                        }
                    }
                case .failure(let message):
                    VStack {
                        Text("Error: \(message)")
                    }
                }
            }
            
            .padding(UIConstants.paddingDefault)
            .sheet(item: $selectedProduct) { product in
                ProductDetailView(product: product) {
                    viewModel.getProducts()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

