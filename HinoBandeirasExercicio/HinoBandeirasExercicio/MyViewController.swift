//
//  MyViewController.swift
//  HinoBandeirasExercicio
//
//  Created by Helaine Alves Pontes on 29/03/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    @IBOutlet weak var myLabelBandeiras2: UILabel!
    
    @IBOutlet weak var myLabelContinentes2: UILabel!
    
    @IBOutlet weak var myImageView2: UIImageView!
    
    @IBOutlet weak var myTextView: UITextView!
    
    
    var selectedFlag: String?
    var selectedCont: String?
    var selectedHin: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabelBandeiras2.text = selectedFlag
        myLabelContinentes2.text = selectedCont
        myImageView2.image = UIImage(named: selectedFlag!)
        myTextView.text = selectedHin
    }


}
