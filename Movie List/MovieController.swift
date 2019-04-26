//
//  MovieController.swift
//  Movie List
//
//  Created by Jeffrey Carpenter on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class MovieController {
    
    var movies: [Movie] = []
    
    // TODO: init method with test data
    
    func create(movieName: String) {
        
        let movie = Movie(name: movieName)
        movies.append(movie)
        
    }
    
    // TODO: update method
    
}

protocol MovieControllerProtocol: AnyObject {
    var movieController: MovieController? { get set }
}
