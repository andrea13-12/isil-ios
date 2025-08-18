//
//  ProductCardView.swift
//  1227_PA3_AndreaTorres
//
//  Created by Andrea Torres on 11/06/25.
//
import SwiftUI

struct ProductCardView: View {
    let product: Product
    
    @StateObject var viewModel = ProductCardViewModel()
            
    var body: some View {
        VStack (alignment:.leading, spacing: UIConstants.spacingSmall){
            AsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: UIConstants.imageSizeSmall)
                    .clipped()
            } placeholder: {
                ProgressView()
                    .frame(height: UIConstants.imageSizeSmall)
            }
           
            Text(product.title)
                .lineLimit(1)
                .font(.headline)
                .bold()
            
            Text(product.category)
                .font(.subheadline)
            
            HStack {
                Text(String(format: "$ %i", product.price))
                    .font(.title3)
                    .bold()
                Spacer()
                Button {
                    viewModel.toggleFavorite(product: product)
                } label: {
                    Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: UIConstants.iconSize, height: UIConstants.iconSize)
                        .foregroundStyle(ColorPalette.primary)
                }

            }
            
        }
        .padding()
     
        .clipShape(RoundedRectangle(cornerRadius: UIConstants.cornerRadiusCard))
        .overlay {
            RoundedRectangle(cornerRadius: UIConstants.cornerRadiusCard)
                .stroke(lineWidth: 2)
                .foregroundStyle(ColorPalette.background)
        }
        .onAppear {
            viewModel.checkFavorite(id: product.id)
        }
    }
}
