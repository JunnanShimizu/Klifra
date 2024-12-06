//
//  SearchView.swift
//  Klifra
//
//  Created by Matthew Quinn on 11/13/24.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""

    var body: some View {
        VStack(spacing: 20) {
            // Search Bar
            TextField("Search", text: $searchText)
                .padding(5)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
                .padding(.top, 30)
            
            Text("Recent Searches:")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
            
            ScrollView {
                VStack(spacing: 15) {
                    SearchItemView(
                        imageName: "thegreatchimneyex",
                        title: "The Great Chimney",
                        details: "Grade: 5.5, Type: Trad\nLocation: Otter Cliffs"
                    )
                    
                    SearchItemView(
                        imageName: "camdenhillsex",
                        title: "Camden Hills",
                        details: "Crag, Location: Camden, ME\n257 Total Climbs"
                    )
                    
                    SearchItemView(
                        imageName: "shaggcragex",
                        title: "Shagg Crag",
                        details: "Crag, Location: Woodstock, ME\n59 Total Climbs"
                    )
                    
                    SearchItemView(
                        imageName: "generoussonsex",
                        title: "Generous Sons",
                        details: "Grade: 5.10b, Type: Sport\nLocation: Shagg Crag"
                    )
                }
            }
            .padding(.leading)
            
            Spacer()
        }
        .background(Color(red: 33 / 255, green: 105 / 255, blue: 70 / 255))
    }
}

struct SearchItemView: View {
    var imageName: String
    var title: String
    var details: String

    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 125, height: 125)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(details)
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    SearchView()
}
