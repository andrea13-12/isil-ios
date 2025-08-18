//
//  FavoriteProductCardView.swift
//  1227_PA3_AndreaTorres
//
//  Created by Andrea Torres on 27/06/25.
//
import SwiftUI

struct FavoriteProductCardView: View {
    @State private var showOptions = false
    @StateObject var viewModel = FavoriteProductCardViewModel()
    
    let favorite: FavoriteProduct
    let onDelete: () -> Void

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: favorite.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 120, height: 100)
                case .success(let image):
                    image.resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 100)
                case .failure:
                    Color.gray.frame(width: 120, height: 100)
                @unknown default:
                    EmptyView().frame(width: 120, height: 100)
                }
            }

            VStack(alignment: .leading) {
                Text(favorite.title)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)
                Text("$ \(favorite.price)")
                    .font(.subheadline)
                
                Button {
                    // Add to cart action
                } label: {
                    HStack {
                        Image(systemName: "cart")
                        Text("Add to cart")
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .overlay {
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(.black, lineWidth: 1)
                    }
                }
                .buttonStyle(.borderless)
                .foregroundStyle(.black)
            }

            Spacer()

            Button {
                showOptions = true
            } label: {
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .rotationEffect(.degrees(90))
            }
            .buttonStyle(.borderless)
            .foregroundStyle(.black)
        }
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 8))

        .sheet(isPresented: $showOptions) {
            VStack(alignment: .leading, spacing: 20) {
                Text("Options").font(.headline)
                
                Button {
                    // Add to cart action
                    showOptions = false
                } label: {
                    Label("Add to cart", systemImage: "cart")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.black)
                }
                
                Button {
                    viewModel.removeFavorite(id: favorite.id)
                    showOptions = false
                    onDelete()
                } label: {
                    Label("Remove from favorites", systemImage: "trash")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.black)
                }

                Spacer()
            }
            .presentationDetents([.height(150)])
            .padding()
        }
    }
}
