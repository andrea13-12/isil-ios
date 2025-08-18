//
//  RestaurantDetailView.swift
//  FoodLab
//
//  Created by Alumno on 30/06/25.
//

import SwiftUI

struct RestaurantDetailView: View {
    let restaurant: Restaurant
    @State var showDetail = false
    
    var body: some View {
        ZStack (alignment: .bottom) {
            GoogleMapView(
                latitude: restaurant.latitude,
                longitude: restaurant.longitude,
                zoom: 15, title: restaurant.title,
                subTitle: restaurant.address)
            .edgesIgnoringSafeArea(.top)
            
            VStack{
                
            }
            .sheet(isPresented: $showDetail) {
                VStack (spacing: 0) {
                    AsyncImage(url: URL(string: restaurant.poster)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(height: 200)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 200)
                                .frame(maxWidth: .infinity)
                                .clipped()
                            
                        case .failure(let error):
                            Color.gray
                                .frame(height: 200)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    VStack(alignment: .leading, spacing: 10) {
                        //contenido que queremos mostrar
                        Text(restaurant.title)
                            .font(.title2)
                            .bold()
                        Text(restaurant.address)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                        HStack(spacing:5){
                            Image(systemName: "star.fill")
                            Text(String(format: "%.1f", restaurant.rating))
                                .font(.subheadline)
                        }
                        Text(restaurant.description)
                            .font(.body)
                            .foregroundStyle(.primary)
                            .padding(.top, 5)
                    }
                    .padding()
                    Spacer()
                }
                .presentationDetents([.height(360), .medium,.large])
                .presentationDragIndicator(.visible)
                
            }
            Button(showDetail ? "Hide" : "Show more"){
                withAnimation{
                    showDetail.toggle()
                }
            }
            .font(.subheadline)
            .foregroundStyle(.primary)
            .bold()
        }
        .padding([.horizontal, .bottom])
    }
        .frame(minWidth: .infinity,)
}
