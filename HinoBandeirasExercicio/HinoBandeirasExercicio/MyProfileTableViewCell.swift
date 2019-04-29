//
//  MyProfileTableViewCell.swift
//  HinoBandeirasExercicio
//
//  Created by Helaine Alves Pontes on 29/03/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import UIKit

class MyProfileTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myLabelBandeiras: UILabel!
    
    @IBOutlet weak var myLabelContinente: UILabel!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
