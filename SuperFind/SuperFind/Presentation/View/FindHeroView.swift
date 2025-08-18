//
//  Untitled.swift
//  SuperFind
//
//  Created by Andrea Torres on 14/07/25.
//

import SwiftUI

struct FindHeroView: View {
    @StateObject var viewModel = FindHeroViewModel()

    @State var selectedHero: Hero? = nil
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(.gray)
                TextField("Search an hero...", text: $viewModel.query)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .onSubmit {
                        viewModel.findHeros()
                    }
            }
            .padding()
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 16))
            
            switch viewModel.uiState {
            case .initialState:
                
                Spacer()
                
            case .loadingState:
                VStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
                
            case .successState(let heroes):
                List {
                    ForEach(heroes) { hero in
                        HeroListItemView(hero: hero)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                selectedHero = hero
                            }
                    }
                }
                .listStyle(.plain)
            case .failureState(let message):
                VStack {
                    Spacer()
                    Text(message)
                    Spacer()
                }
                
            }
        }
        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
        .sheet(item: $selectedHero) { hero in
            HeroDetailView(hero: hero)
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    FindHeroView()
}
