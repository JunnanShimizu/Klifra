//
//  CragView.swift
//  Klifra
//
//  Created by Matthew Quinn on 11/25/24.
//

import SwiftUI

struct CragDetailView: View {
    let crag: Crag

    init(crag: Crag) {
        self.crag = crag
        
        // Customize the navigation bar appearance
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 33 / 255, green: 105 / 255, blue: 70 / 255, alpha: 1) // Dark green
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white] // White title text
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        // Customize the tab bar appearance to avoid darkening on scroll
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = UIColor.systemBackground // Default background for the tab bar
        
        // Apply this appearance globally to avoid the issue
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Title
                Text(crag.name)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                
                // Image Section
                Image(crag.picture)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10) // Rounded corners
                    .shadow(radius: 5) // Subtle shadow
                
                // Description
                if !crag.description.isEmpty {
                    Text(crag.description)
                        .font(.body)
                        .foregroundColor(.white)
                }
                
                // Getting There Section
                Text("Getting There:")
                    .font(.title3)
                    .bold()
                    .underline()
                    .foregroundColor(.white)
                
                // Parking Details
                Group {
                    Text("Parking:")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("GPS Coordinates: \(crag.parking.GPScoords.lat), \(crag.parking.GPScoords.long)")
                        .foregroundColor(.white)
                    Text("Info: \(crag.parking.pinfo)")
                        .foregroundColor(.white)
                    
                    Link(destination: URL(string: crag.parking.link)!) {
                        Text("Directions")
                            .underline()
                            .foregroundColor(.blue)
                    }
                }
                
                // Approach Details
                Group {
                    Text("Approach:")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("GPS coordinates: \(crag.approach.GPScoords.lat), \(crag.approach.GPScoords.long)")
                        .foregroundColor(.white)
                    Text("Info: \(crag.approach.ainfo)")
                        .foregroundColor(.white)
                    
                    Link(destination: URL(string: crag.approach.link)!) {
                        Text("Directions")
                            .underline()
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding()
        }
        .navigationTitle(crag.name)
        .navigationBarTitleDisplayMode(.inline) // Inline title for a compact look
        .background(Color(red: 33 / 255, green: 105 / 255, blue: 70 / 255).edgesIgnoringSafeArea(.all)) // Dark green background
    }
}
