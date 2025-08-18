//
//  MovieListItemView.swift
//  EasyMovie
//
//  Created by Andrea Torres on 7/07/25.
//

import SwiftUI

struct MovieListItemView:View {
    let movie: Movie
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: movie.poster)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(height: 160)
                    
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .frame(width: 120, height: 160)
                    
                case .failure:
                    Color.gray
                        .frame(height: 180)
                    
                    @unknown default:
                    EmptyView()
                }
            }
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                Text(movie.overview)
                    .font(.subheadline)
                    .lineLimit(2)
                Spacer()
            }
            .padding(.vertical)
        }
    }
}
