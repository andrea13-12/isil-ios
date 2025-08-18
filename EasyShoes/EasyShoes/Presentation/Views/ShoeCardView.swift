//
//  ShoeCardView.swift
//  EasyShoes
//
//  Created by Andrea Torres on 2/06/25.
//

import SwiftUI

struct ShoeCardView: View {
    let shoe: Shoe
    var body: some View {
        //muestra los dato de forma vertical
        VStack(alignment: .leading, spacing: UIConstants.spacingSmall){
            AsyncImage(url: URL(string: shoe.image)) { image in
                image
                    .resizable()
                    .frame(width: .infinity, height: UIConstants.imageSizeSmall)
            } placeholder: {
                ProgressView()
                    .frame(height: UIConstants.imageSizeSmall)
            }
            Text(shoe.name)
                .lineLimit(1)
                .font(.headline)
                .bold()
            
            Text(shoe.brand)
                .font(.subheadline)
            HStack{
                Text(String(format: "$ %i", shoe.price))
                    .font(.title2)
                    .bold()
                Spacer()

                Button{
                }label: {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: UIConstants.iconSize, height: UIConstants.iconSize)
                        .foregroundStyle(ColorPalette.primary)
                }
            }
        }
        .padding()
        .clipShape(RoundedRectangle(cornerRadius:UIConstants.cornerRadiusCard))
        .overlay{
            RoundedRectangle(cornerRadius: UIConstants.cornerRadiusCard)
                .stroke(lineWidth: 2)
                .foregroundStyle(ColorPalette.background)
        }
    }

}
#Preview {
    ShoeCardView(shoe: Shoe(id: 1, name: "Adidas Samba", brand: "Adidas", gender: "", category: "", price: 200, image: "https://www.hustgt.com/cdn/shop/products/Tenis_Samba_OG_Blanco_BB6975_01_standard-removebg--triangle.png"))
}

