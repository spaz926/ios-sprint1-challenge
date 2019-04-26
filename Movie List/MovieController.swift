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
    
    init() {
        #warning("Test Data Active")
        create(movieName: "Test Movie 1")
        create(movieName: "Test Movie 2")
    }
    
    func create(movieName: String) {
        
        let movie = Movie(name: movieName)
        movies.append(movie)
        
    }
    
    func updateSeen(at index: Int) {
        movies[index].isSeen = !movies[index].isSeen
    }
    
    func delete(at index: Int) {
        movies.remove(at: index)
    }
    
    func move(from: Int, to: Int) {
        let movie = movies[from]
        movies.remove(at: from)
        movies.insert(movie, at: to)
    }
    
    func editName(at index: Int, newName: String) {
        movies[index].name = newName
    }
    
}

protocol MovieControllerProtocol: AnyObject {
    var movieController: MovieController? { get set }
}
