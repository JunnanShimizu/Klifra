//
//  CragService.swift
//  Klifra
//
//  Created by Matthew Quinn on 11/21/24.
//

import Foundation

struct Crag: Codable {
    let _id: String
    let name: String
    let parking: Parking
    let approach: Approach
    let description: String
    let picture: String
    
    struct Parking: Codable {
        let GPScoords: GPSCoords
        let link: String
        let pinfo: String
    }
    
    struct Approach: Codable {
        let GPScoords: GPSCoords
        let link: String
        let ainfo: String
    }
    
    struct GPSCoords: Codable {
        let lat: Double
        let long: Double
    }
    
    enum CodingKeys: String, CodingKey {
        case _id, name, parking, approach, description, picture
    }
}

class CragService {
    static func fetchCrags(completion: @escaping ([Crag]?, Error?) -> Void) {
        guard let url = URL(string: "http://3.22.118.78:3000/crags") else {
            print("Invalid URL")
            completion(nil, NSError(domain: "Invalid URL", code: 0))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Log raw response details
            if let error = error {
                print("Network Error: \(error)")
                completion(nil, error)
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Status Code: \(httpResponse.statusCode)")
            }
            
            guard let data = data else {
                print("No data received")
                completion(nil, NSError(domain: "No data", code: 0))
                return
            }
            
            // Log raw JSON string
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Received JSON: \(jsonString)")
            }
            
            do {
                let decoder = JSONDecoder()
                let crags = try decoder.decode([Crag].self, from: data)
                completion(crags, nil)
            } catch {
                print("Decoding Error: \(error)")
                completion(nil, error)
            }
        }.resume()
    }
}
