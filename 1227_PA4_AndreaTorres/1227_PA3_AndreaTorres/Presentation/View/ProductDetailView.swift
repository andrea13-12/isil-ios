//
//  ProductDetailView.swift
//  1227_PA3_AndreaTorres
//
//  Created by Andrea Torres on 28/06/25.
//


import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
    let onToggle: () -> Void
    
    @StateObject var viewModel = ProductDetailViewModel()
    
    
    var body: some View {
        VStack (alignment:.leading, spacing: UIConstants.spacingSmall){
            ZStack (alignment: .topTrailing){
                AsyncImage(url: URL(string: product.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 240)
                        .frame(maxWidth: .infinity)
                        .clipped()
                } placeholder: {
                    ProgressView()
                        .frame(height: 240)
                        .frame(maxWidth: .infinity)
                }
                Button {
                    viewModel.toggleFavorite(product: product)
                    onToggle()
                } label: {
                    Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: UIConstants.iconSize, height: UIConstants.iconSize)
                }

            }

            
            HStack {
                Text(product.title)
                    .lineLimit(1)
                    .font(.headline)
                    .bold()
                Spacer()
                Text(String(format: "$ %i", product.price))
                    .font(.headline)
                    .bold()
            }
            
            Text(product.description)
                .font(.subheadline)

            
            Spacer()
            Button {
                
            } label: {
                Text("Add to cart")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(ColorPalette.primary)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
        }
        .onAppear {
            viewModel.checkFavorite(id: product.id)
        }
        .padding()
        
    }
        

}
