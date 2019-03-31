//
//  File.swift
//  cfw
//
//  Created by Johannes Neutze on 31.03.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

import Foundation

fileprivate extension Array where Element == JSONDictionary {
     func toSortedAthleteArray() -> [AthleteResponse] {
        var array = [AthleteResponse]()
        self.forEach { athlete in
            array.append(AthleteResponse(jsonDictionary : athlete))
        }
        array = array.sorted(by: { $0.score < $1.score })
        
        return array
    }
}

fileprivate extension Array where Element == AthleteResponse {
    func toAthleteEntities() -> [AthleteEntity] {
        var athletes = [AthleteEntity]()
        for (index, athlete) in self.enumerated() {
            athletes.append(
                AthleteEntity(
                    rank: (index + 1),
                    athleteResponse: athlete
                )
            )
        }
        
        return athletes
    }
}

class AthleteDownloadUseCase {
    let endpoint = "https://demo0095153.mockable.io/athletes"
    let node = "athletes"

    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    func execute(callback: @escaping ([AthleteEntity]) -> ()) {
        var athletes = [AthleteEntity]()
        
        dataTask?.cancel()
        
        if var urlComponents = URLComponents(string: endpoint) {

            guard let url = urlComponents.url else { return }

            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                defer { self.dataTask = nil }

                if let data = data {
                    let json = try! JSONSerialization.jsonObject(with: data, options: [])
                    let dictionary = json as! JSONDictionary
                    let athleteDictionaries = dictionary[self.node] as! [JSONDictionary]
                    let sortedAthletes = athleteDictionaries.toSortedAthleteArray()
                    
                    athletes = sortedAthletes.toAthleteEntities()
                    
                    athletes.forEach { athlete in
                        print(athlete)
                    }
                }
                
                DispatchQueue.main.async {
                    callback(athletes)
                }
            }
            
            dataTask?.resume()
        }
    }
    
}
