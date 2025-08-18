//
//  HomeView.swift
//  EasyShoes
//
//  Created by Andrea Torres on 26/05/25.
//

import SwiftUI

struct Banner: View {
   
    var body: some View {
        
        HStack{
            VStack(alignment: .leading, spacing: UIConstants.spacingSmall){
                Text("Get Your Special Sale")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.white)
                Text("Up to 50% Off")
                    .foregroundStyle(ColorPalette.primary)
                Button(action: {}) {
                    Text("Show Now")
                }
                .padding(UIConstants.paddingDefault)
                .background(ColorPalette.primary)
                .foregroundStyle(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: UIConstants.cornerRadiusButton))
            }
            Image("adidas-banner")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: UIConstants.imageSizeSmall)
        }
        .padding(UIConstants.paddingDefault)
        .background(LinearGradient(colors: [Color.black, ColorPalette.primary], startPoint: .leading, endPoint: .trailing))
        .clipShape(RoundedRectangle(cornerRadius: UIConstants.cornerRadiusDefault))
        
    }
}
#Preview {
    HomeView()
}
