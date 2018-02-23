//
//  RepositoryTableViewCell.swift
//  GitHubAccess
//
//  Created by Nadiia Pavliuk on 2/22/18.
//  Copyright © 2018 Nadiia Pavliuk. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    @IBOutlet weak var forksAndStarsLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
