//
//  ViewModel.swift
//  MovieRater
//
//  Created by Tom Marler on 1/26/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
    // Not nil injected from storyboard
    @IBOutlet var moviesClient: MoviesClient!
    
    // This will be nil as
    var movies: NSArray?
    
    func fetchMovies(completion: @escaping () ->()) {
        moviesClient.fetchMovies { movies in
            self.movies = movies
            completion()
            
        }
    }
    
    // This is injected into the ViewController from the storyboard
    
    func numberOfItemsInSection(section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    /// Need to fix this for some reason it is not idexing th row correctly
    func titleForItemAtIndexPath(indexPath: IndexPath) -> String {
        print("This is from titleForItemAtIndexPath")
        let indexPath = movies![indexPath.row] as! NSDictionary
        let category = indexPath.value(forKey: "category") as! NSDictionary
        let attributes = category["attributes"] as! NSDictionary
        let cell = attributes.value(forKey: "label") as? String
        print(attributes.value(forKey: "label"))
        //print(attributes)
        //print(indexPath.allKeys)
        //print(indexPath)
        //print(indexPath.value(forKey: "im:contentType"))

        return cell!
    }
    

}
