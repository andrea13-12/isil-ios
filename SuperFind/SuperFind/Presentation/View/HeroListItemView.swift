//
//  HeroListItemView.swift
//  SuperFind
//
//  Created by Andrea Torres on 15/07/25.
//

import SwiftUI

struct HeroListItemView: View {
    let hero: Hero
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: hero.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 120, height: 160)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .frame(width: 120, height: 160)
                case .failure:
                    Color.gray
                        .frame(width: 120, height: 160)

                @unknown default:
                    EmptyView()
                }
            }
            VStack (alignment: .leading){
                Text(hero.name)
                    .font(.headline)
                Text(hero.biography.fullName)
                    .font(.subheadline)
                    .lineLimit(2)
                Text("Power: \(hero.powerstats.power)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Alignment: \(hero.biography.alignment)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical)
            
        }
    }
}

    

