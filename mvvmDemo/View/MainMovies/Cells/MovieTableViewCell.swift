//
//  MovieTableViewCell.swift
//  mvvmDemo
//
//  Created by Hassan_Khamis on 10/17/20.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var releaseDate_lbl: UILabel!
    @IBOutlet weak var movieTitle_lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
            
        // Configure the view for the selected state
    }
    
}
