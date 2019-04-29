//
//  CustomTableViewCell.swift
//  AutoLayoutProject
//
//  Created by Davi Cabral on 17/04/2018.
//  Copyright © 2018 Davi Cabral. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        button.layer.cornerRadius = 4
        
    }


}
