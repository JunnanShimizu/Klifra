//
//  UserView.swift
//  Klifra
//
//  Created by Matthew Quinn on 11/12/24.
//

import SwiftUI
import MapKit

struct UserView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 35) {
            // Removed Spacer to reduce the gap
            
            HStack(alignment: .center, spacing: 5) {
                Image("crazygirl")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                Text("crazygirl239")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.leading, 15)
            }
            
            ScrollView {
                VStack(alignment: .center, spacing: 10) {
                    Text("Climber Stats")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    ZStack(alignment: .leading) {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                            .frame(maxWidth: 300)
                            .padding(.horizontal, 20)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Climbs Sent: 37")
                            Text("Highest Grade: 5.10d")
                            Text("Hardest Flash: 5.9a")
                            Text("Favorite Location: Shagg Crag\n\t\t\t\t\t(7 climbs sent)")
                        }
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                        .padding(30)
                    }
                    .fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: .infinity, alignment: .center)
                
                HStack(alignment: .center, spacing: 5) {
                    VStack(alignment: .center, spacing: 10) {
                        Text("Favorites")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 2)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                                .frame(maxWidth: 300)
                                .padding(.horizontal, 20)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Generous Sons")
                                Text("The Great Escape")
                                Text("Fireman's Ladder")
                                Text("Shagg It")
                            }
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .padding(30)
                        }
                        .fixedSize(horizontal: false, vertical: true)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    VStack(alignment: .center, spacing: 10) {
                        Text("Recent Sends")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth: 2)
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.1)))
                                .frame(maxWidth: 300)
                                .padding(.horizontal, 20)
                            
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Fireman's Ladder")
                                Text("Rogue Wave")
                                Text("Zephyr")
                                Text("Sober Seaman")
                                Text("The Great Chimney")
                                Text("Rock Lobster")
                            }
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                            .padding(30)
                        }
                        .fixedSize(horizontal: false, vertical: true)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .padding(.top, 2) // Reduced top padding
        .padding(.bottom, 30)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(red: 33 / 255, green: 105 / 255, blue: 70 / 255))
    }
}

#Preview {
    UserView()
}
