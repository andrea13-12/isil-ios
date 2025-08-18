//
//  Banner.swift
//  EasyShoes
//
//  Created by Alumno on 26/05/25.
//

import SwiftUI

struct Banner: View {
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: UIConstants.spacingDefault) {
                Text("Fashion sale up to")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.white)
                Text("25% off")
                Text("Get a special offer from out featured fashion products starts today")
                    .foregroundStyle(Color.white)
                Button(action: {}) {
                    Text("Show now")
                }
                .padding(UIConstants.paddingDefault)
                .background(Color.white)
                .foregroundStyle(Color.black)
                .clipShape(RoundedRectangle(cornerRadius: UIConstants.cornerRadiusButton))
            }
            Image("girlBanner")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: UIConstants.imageSizeBig)
        }
        .padding(UIConstants.paddingDefault)
        .background(LinearGradient(colors: [Color.black, ColorPalette.primary], startPoint: .leading, endPoint: .trailing))
    }
}
