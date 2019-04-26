//
//  Movie.swift
//  Movie List
//
//  Created by Jeffrey Carpenter on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

struct Movie {

    var name: String
    var isSeen: Bool
    
    init(name: String, isSeen: Bool = false) {
        self.name = name
        self.isSeen = isSeen
    }
    
}
