//
//  ViewController.swift
//  StepperEx
//
//  Created by Helaine Alves Pontes on 21/03/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel1: UILabel!
    
    @IBOutlet weak var myStepper1: UIStepper!
    
    @IBAction func mudou(_ sender: UIStepper) {
        myLabel1.text = String(Int(myStepper1.value))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

