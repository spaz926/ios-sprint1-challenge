//
//  MoviesTableViewController.swift
//  Movie List
//
//  Created by Jeffrey Carpenter on 4/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MoviesTableViewController: UITableViewController, MovieControllerProtocol, MovieTableViewCellDelegate {

    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var movieController: MovieController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.reloadData()
    }
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        
        tableView.isEditing = !tableView.isEditing
        editButton.title = tableView.isEditing ? "done" : "edit"
        
    }
    
    func tappedSeenButton(on cell: MovieTableViewCell) {
        
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        movieController?.updateSeen(at: indexPath.row)
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let movieController = movieController else { return 0 }
        
        return movieController.movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)

        // Configure the cell...
        guard let movieCell = cell as? MovieTableViewCell else { return cell }
        
        let movie = movieController?.movies[indexPath.row]
        movieCell.delegate = self
        movieCell.movie = movie
        
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            movieController?.delete(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        movieController?.move(from: fromIndexPath.row, to: to.row)
    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

}
