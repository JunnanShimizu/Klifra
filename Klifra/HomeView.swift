//
//  HomeView.swift
//  Klifra
//
//  Created by Matthew Quinn on 11/10/24.
//

import SwiftUI
import MapKit

struct HomeView: View {
    var body: some View {
        VStack(spacing: 40) {
            // Original Text at the Top
            VStack(alignment: .center, spacing: 5) {
                Text("Welcome to Klifra!")
                    .font(.title)
                    .foregroundColor(.white)
                
                Text("Climb safe and send hard!")
                    .font(.body)
                    .foregroundColor(.white)
            }
            .padding(.top, 20)

            // Link section
            VStack(alignment: .leading, spacing: 20) { // Align content to the left
                // Link 1
                Link(destination: URL(string: "https://www.nps.gov/subjects/climbing/staying-safe.htm")!) {
                    HStack(alignment: .center, spacing: 10) {
                        Image("npslogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        
                        Text("National Park Service\nSafety Information")
                            .font(.headline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                    }
                }
                
                // Link 2
                Link(destination: URL(string: "https://blog.nols.edu/rock-climbing-gear-recommendations")!) {
                    HStack(alignment: .center, spacing: 10) {
                        Image("nolslogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        
                        Text("NOLS Basic Gear\nInformation")
                            .font(.headline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                    }
                }
                
                // Link 3
                Link(destination: URL(string: "https://www.vdiffclimbing.com/sport/")!) {
                    HStack(alignment: .center, spacing: 10) {
                        Image("vdifflogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        
                        Text("VDiff Guide to\nSport Climbing")
                            .font(.headline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                    }
                }
                
                // Link 4
                Link(destination: URL(string: "https://www.climbing.com")!) {
                    HStack(alignment: .center, spacing: 10) {
                        Image("magazinelogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                        
                        Text("Climbing Magazine\nand News")
                            .font(.headline)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 33 / 255, green: 105 / 255, blue: 70 / 255))
    }
}

#Preview {
    HomeView()
}
