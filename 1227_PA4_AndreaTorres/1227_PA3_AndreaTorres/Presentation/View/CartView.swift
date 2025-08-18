//
//  CartView.swift
//  1227_PA3_AndreaTorres
//
//  Created by Andrea Torres on 11/06/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if cartViewModel.cartItems.isEmpty {
                    EmptyCartView()
                } else {
                    List {
                        ForEach($cartViewModel.cartItems) { $product in
                            CartItemRow(product: $product)
                        }
                        .onDelete { indices in
                            indices.forEach { index in
                                cartViewModel.removeFromCart(productId: cartViewModel.cartItems[index].id)
                            }
                        }
                    }
                    .listStyle(.plain)
                    
                    // Checkout section
                    VStack(spacing: UIConstants.spacingDefault) {
                        HStack {
                            Text("Total:")
                                .font(.title2)
                            Spacer()
                            Text(String(format: "$%.2f", cartViewModel.totalPrice))
                                .font(.title2.bold())
                                .foregroundStyle(ColorPalette.primary)
                        }
                        .padding(.horizontal)
                        
                        Button(action: {}) {
                            Text("Pay Now")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(ColorPalette.primary)
                                .foregroundStyle(.white)
                                .clipShape(RoundedRectangle(cornerRadius: UIConstants.cornerRadiusDefault))
                        }
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                    .background(Color(.systemBackground))
                }
            }
            .navigationTitle("Your Cart")
        }
    }
}

struct CartItemRow: View {
    @Binding var product: Product
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
        HStack(spacing: UIConstants.spacingDefault) {
            AsyncImage(url: URL(string: product.image)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 60, height: 60)
            .cornerRadius(UIConstants.cornerRadiusSmall)
            
            VStack(alignment: .leading, spacing: UIConstants.spacingSmall) {
                Text(product.title)
                    .font(.headline)
                    .lineLimit(2)
                
                Text(String(format: "$%.2f", product.price))
                    .font(.subheadline)
                    .foregroundStyle(ColorPalette.primary)
            }
            
            Spacer()
            
            // Quantity controls
            HStack(spacing: UIConstants.spacingSmall) {
                Button {
                    cartViewModel.updateQuantity(
                        productId: product.id,
                        newQuantity: product.quantity - 1
                    )
                } label: {
                    Image(systemName: "minus")
                        .frame(width: 24, height: 24)
                }
                
                Text("\(product.quantity)")
                    .frame(minWidth: 20)
                
                Button {
                    cartViewModel.updateQuantity(
                        productId: product.id,
                        newQuantity: product.quantity + 1
                    )
                } label: {
                    Image(systemName: "plus")
                        .frame(width: 24, height: 24)
                }
            }
            .buttonStyle(.bordered)
            .tint(ColorPalette.primary)
            
            // Delete button
            Button {
                cartViewModel.removeFromCart(productId: product.id)
            } label: {
                Image(systemName: "trash")
                    .foregroundStyle(.red)
            }
        }
        .padding(.vertical, UIConstants.paddingSmall)
    }
}

struct EmptyCartView: View {
    var body: some View {
        VStack(spacing: UIConstants.spacingDefault) {
            Image(systemName: "cart")
                .font(.system(size: 60))
                .foregroundStyle(.gray)
            Text("Your cart is empty")
                .font(.title2)
                .bold()
            Text("Add some products to get started")
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray)
        }
        .padding()
    }
}

// Preview
#Preview {
    CartView()
        .environmentObject(CartViewModel())
}
