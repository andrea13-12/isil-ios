//
//  HeroDetailView.swift
//  SuperFind
//
//  Created by Andrea Torres on 15/07/25.
//

import SwiftUI

struct HeroDetailView: View {
    let hero: Hero
    @State var isFavorite = false
    @EnvironmentObject var viewModel: FindHeroViewModel
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottomTrailing){
                AsyncImage(url: URL(string: hero.image)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(height: 400)
                            .frame(maxWidth: .infinity)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 400)
                            .frame(maxWidth: .infinity)
                            .clipShape(RoundedRectangle(cornerRadius: 8))

                    case .failure:
                        Color.gray
                            .frame(height: 400)
                            .frame(maxWidth: .infinity)

                    @unknown default:
                        EmptyView()
                    }
                }
                Button {
                    viewModel.toggleFavorite(hero: hero)
                    isFavorite.toggle()
                } label: {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundStyle(.black)
                    
                }
                .padding(12)
                .background(.white)
                .clipShape(Circle())
                .padding()

            }
            
            VStack(alignment: .leading) {
                Text(hero.name)
                        .font(.title)
                HStack {
                        Text("Full Name:").bold()
                        Text(hero.biography.fullName)
                    }
                    HStack {
                        Text("Alter Egos:").bold()
                        Text(hero.biography.alterEgos)
                    }
                    HStack {
                        Text("Publisher:").bold()
                        Text(hero.biography.publisher)
                    }
                    HStack {
                        Text("Alignment:").bold()
                        Text(hero.biography.alignment)
                    }
                    HStack {
                        Text("First Appearance:").bold()
                        Text(hero.biography.firstAppearance)
                    }
                    HStack {
                        Text("Place of Birth:").bold()
                        Text(hero.biography.placeOfBirth)
                    }
                    HStack {
                        Text("Occupation:").bold()
                        Text(hero.work.occupation)
                    }
                    HStack {
                        Text("Group Affiliation:").bold()
                        Text(hero.connections.groupAffiliation)
                    }
                    HStack {
                        Text("Relatives:").bold()
                        Text(hero.connections.relatives)
                    }
                    Text("Powerstats:")
                        .font(.headline)
                    HStack {
                        Text("Intelligence:").bold()
                        Text(hero.powerstats.intelligence)
                    }
                    HStack {
                        Text("Strength:").bold()
                        Text(hero.powerstats.strength)
                    }
                    HStack {
                        Text("Speed:").bold()
                        Text(hero.powerstats.speed)
                    }
                    HStack {
                        Text("Durability:").bold()
                        Text(hero.powerstats.durability)
                    }
                    HStack {
                        Text("Power:").bold()
                        Text(hero.powerstats.power)
                    }
                    HStack {
                        Text("Combat:").bold()
                        Text(hero.powerstats.combat)
                    }
                
            }
            .padding()
           
            Spacer()
        }
        .onAppear {
            isFavorite = viewModel.isFavorite(id: hero.id)
            
        }
    }
}
