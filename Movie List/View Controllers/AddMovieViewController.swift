//
//  AddMovieViewController.swift
//  Movie List
//
//  Created by Jeffrey Carpenter on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController, MovieControllerProtocol {
    
    var movieController: MovieController?

    @IBOutlet weak var movieTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        
        // Ensure VC has a movieController, and movieTextField is not empty or nil
        guard let movieController = movieController,
        let movieName = movieTextField.text,
        !movieName.isEmpty
        else { return }
        
        // Add movie to list
        movieController.create(movieName: movieName)
        
        // Clear the movieTextField
        movieTextField.text = ""
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
