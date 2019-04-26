//
//  MoviesTabBarViewController.swift
//  Movie List
//
//  Created by Jeffrey Carpenter on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MoviesTabBarViewController: UITabBarController {
    
    let movieController = MovieController()

    override func viewDidLoad() {
        super.viewDidLoad()

        for childVC in children {
            
            guard let childVC = childVC as? MovieControllerProtocol else { return }
            childVC.movieController = movieController
            
        }
        
    }

}
