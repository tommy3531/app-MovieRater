//
//  MoviesClient.swift
//  MovieRater
//
//  Created by Tom Marler on 1/26/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import UIKit

class MoviesClient: NSObject {
    
    typealias JSON = [String: Any]

    
    func fetchMovies(completion: @escaping (NSArray?) -> ()) {
        // fetch Data
        
        let urlstring = "https://itunes.apple.com/us/rss/topmovies/limit=25/json"
        let url = URL(string: urlstring)!
        let urlRequest = URLRequest(url: url)
        
        // Set up the session
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        // make the request
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                completion(nil)
                return
            }
            
            guard let data = data else { return }
            /*
             
             TODO: This needs work I am not parsing the JSON correctly
             
             */
            if let jsonDictionary = try? JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {

                print("This is the Feeddictionary")
                let feedDictionary = jsonDictionary?.value(forKey: "feed") as? NSDictionary
                let entryArray = feedDictionary?.value(forKey: "entry") as? NSArray
                completion(entryArray)
                return
                
            }
                //print((jsonDictionary.value(forKey: "entry"))
            //let jsonArray = jsonDictionary["entry"] as? [NSArray]
            //print(jsonArray)
//            print(jsonDictionary)
//            completion(nil)
//            return
        }

        
        task.resume()
        // call the completion block
    }

}
