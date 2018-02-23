//
//  ViewController.swift
//  GitHubAccess
//
//  Created by Nadiia Pavliuk on 2/21/18.
//  Copyright © 2018 Nadiia Pavliuk. All rights reserved.
//

import UIKit
import SwiftSpinner

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var repositories = [RepositoryStructure]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJSON {
            self.tableView.reloadData()
            SwiftSpinner.hide()
        }
        tableView.delegate = self
        tableView.dataSource = self
        SwiftSpinner.useContainerView(self.view)
        SwiftSpinner.show("Preparing data...")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! RepositoryTableViewCell
        cell.titleLabel?.text = repositories[indexPath.row].name.capitalized
        cell.forksAndStarsLabel?.text = "Fork:" + String(repositories[indexPath.row].forks) + " Star:" + String(repositories[indexPath.row].watchers)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController {
            destination.repository = repositories[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
    func downloadJSON(completed: @escaping () -> ()) {
        
        let url = URL(string: "https://api.github.com/users/cocoapods/repos?page=1&per_page=100;%20rel=next")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.repositories = try JSONDecoder().decode([RepositoryStructure].self, from: data!)
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print("Error \(error)")
                }
            }
            }.resume()
       
    }
}

