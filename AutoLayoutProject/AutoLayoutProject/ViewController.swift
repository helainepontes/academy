//
//  ViewController.swift
//  AutoLayoutProject
//
//  Created by Davi Cabral on 17/04/2018.
//  Copyright © 2018 Davi Cabral. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func didTouchButton(_ sender: UIButton) {
        if var text = label.text {
            text += "\nMais uma frase"
            label.text = text
        }
    }
    
    @IBAction func didTouchClearButton(_ sender: UIButton) {
        self.label.text = "Texto inicial"
    }
}

