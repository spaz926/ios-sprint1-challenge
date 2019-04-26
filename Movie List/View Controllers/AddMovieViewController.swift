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
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))

    }
    
    @IBAction func submitButtonPressed(_ sender: UIButton) {
        
        // Ensure VC has a movieController, and movieTextField is not empty or nil
        guard let movieController = movieController,
        let movieName = movieTextField.text,
        !movieName.isEmpty
        else { return }
        
        // Add movie to list
        movieController.create(movieName: movieName)
        
        // Clear the movieTextField and dismiss keyboard
        movieTextField.text = ""
        movieTextField.resignFirstResponder()
        
    }
    
}
