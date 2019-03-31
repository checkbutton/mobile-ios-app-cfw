//
//  AthleteDownloadUseCase.swift
//  cfw
//
//  Created by Johannes Neutze on 31.03.19.
//  Copyright © 2019 Johannes Neutze. All rights reserved.
//

import Foundation

typealias JSONDictionary = [String:Any]

class AthleteDownloadUseCase {
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    func execute(callback: @escaping ([AthleteEntity]) -> ()) {
        var articles = [AthleteEntity]()

        dataTask?.cancel()
        
        if var urlComponents = URLComponents(string: "http://demo0095153.mockable.io/athletes") {
            
            guard let url = urlComponents.url else { return }
            
            dataTask = defaultSession.dataTask(with: url) { data, response, error in
                defer { self.dataTask = nil }
                if let data = data {
                    let json = try! JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                   // let dictionary = json as! JSONDictionary
                    
                   // let athletesResponse = dictionary["athletes"] as! [JSONDictionary]
                    
                    //var athleteResponses = [AthleteResponse]()
                    
                   // for (key, value) in athletesResponse {
                   //     athleteResponses.append("\(key) \(value)")
                   // }
                    
                  //  articles = athletesResponse.flatMap { athlete in
                  //      return nil//AthleteEntity(dictionary :dictionary)
                    //}
                }
                
                DispatchQueue.main.async {
                    callback(articles)
                }
            }

            dataTask?.resume()
        }
    }
    
}
