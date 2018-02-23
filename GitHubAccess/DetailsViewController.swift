//
//  DetailsViewController.swift
//  GitHubAccess
//
//  Created by Nadiia Pavliuk on 2/21/18.
//  Copyright © 2018 Nadiia Pavliuk. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    // MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var forksCountLabel: UILabel!
    @IBOutlet weak var starsCountLabel: UILabel!
    @IBOutlet weak var createdLabel: UILabel!
    @IBOutlet weak var updatedLabel: UILabel!
     @IBOutlet weak var pushedLabel: UILabel!
     @IBOutlet weak var languageLabel: UILabel!
    var repository: RepositoryStructure?

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let tap = UITapGestureRecognizer(target: self, action: #selector(DetailsViewController.tapFunction(sender:)))
        urlLabel.isUserInteractionEnabled = true
        urlLabel.addGestureRecognizer(tap)
        
        nameLabel.text = repository?.name
        descriptionLabel.text = repository?.description
        urlLabel.text = String(describing: repository!.html_url!)
        forksCountLabel.text = String(describing: repository!.forks)
        starsCountLabel.text = String(describing: repository!.watchers)
        languageLabel.text = "Language: " + (repository?.language ?? "Undefined")
        createdLabel.text = "Created at " + (repository?.created_at)!
        updatedLabel.text = "Updated at " + (repository?.updated_at)!
        pushedLabel.text = "Pushed at " + (repository?.pushed_at)!
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        if let requestUrl = URL(string: "\(repository!.html_url!)") {
            UIApplication.shared.openURL(requestUrl)
            print(requestUrl)
        }
//        print("tap working")
    }

}
