//
//  ViewController.swift
//  MovieRater
//
//  Created by Tom Marler on 1/26/18.
//  Copyright © 2018 Tom Marler. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    // Injected via Storyboard
    @IBOutlet var viewModel: ViewModel!
    @IBOutlet var tableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchMovies {
            DispatchQueue.main.async {
                self.tableView.reloadData()

            }
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // Get information for ViewModel
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInSection(section: section)
    }
    
    // Return cell at a given index
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        // Send data to the send and apply to UI
        configureCell(cell: cell, forRowAtIndexPath: indexPath)
        return cell
    }
    
    // THIS IS AN ISSUE AS WELL
    /*
     
     TODO: NEED TO FIX THIS 
     
     */
    func configureCell(cell: UITableViewCell, forRowAtIndexPath indexPath: IndexPath) {
        cell.textLabel?.text = viewModel.titleForItemAtIndexPath(indexPath: indexPath)
        //print(cell.textLabel?.text)
    }
    




}

