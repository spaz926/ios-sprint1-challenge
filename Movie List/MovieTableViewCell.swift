//
//  MovieTableViewCell.swift
//  Movie List
//
//  Created by Jeffrey Carpenter on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol MovieTableViewCellDelegate: AnyObject {
    
    func tappedSeenButton(on cell: MovieTableViewCell)
    
}

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var seenButton: UIButton!
    
    var movie: Movie? {
        didSet {
            updateView()
        }
    }
    
    weak var delegate: MovieTableViewCellDelegate?
    
    private func updateView() {
        
        guard let movie = movie else { return }
        
        movieNameLabel.text = movie.name
        
        if movie.isSeen {
            seenButton.setTitle("Seen", for: .normal)
        } else {
            seenButton.setTitle("Not Seen", for: .normal)
        }
        
    }
    
    @IBAction func seenButtonPressed(_ sender: UIButton) {
        
        delegate?.tappedSeenButton(on: self)
        
    }

}
