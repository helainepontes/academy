//
//  ViewController.swift
//  SwitchEx
//
//  Created by Helaine Alves Pontes on 21/03/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var mySwitch2: UISwitch!
    @IBOutlet weak var mySwitch1: UISwitch!
    @IBOutlet weak var myLabel1: UILabel!
    
    @IBOutlet weak var myLabel2: UILabel!
    
    @IBAction func mudou(_ sender: UISwitch) {
        if sender.isOn == true{
            if sender == mySwitch2{
                myLabel1.text = "Ligado"
            }
            else{
                myLabel2.text = "Ligado"
            }
        }
        else{
            if sender == mySwitch2{
                myLabel1.text = "Desligado"
            }
            else{
                myLabel2.text = "Desligado"
            }
        }
    }
    
override func viewDidLoad() {
        super.viewDidLoad()
    }

}


