//
//  CustomTableViewCell.swift
//  MarvelVsCapcom2
//
//  Created by Dalvin Sejour on 1/14/19.
//  Copyright © 2019 Dalvin Sejour. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var characterImage: UIImageView!
    @IBOutlet var characterName: UILabel!
    @IBOutlet var moveButton: UIButton!
    @IBOutlet var moveImage: UIImageView!
    @IBOutlet var moveName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
