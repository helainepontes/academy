//
//  ViewController.swift
//  SliderEx
//
//  Created by Helaine Alves Pontes on 21/03/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel1: UILabel!
    
    @IBOutlet weak var myLabel2: UILabel!
    
    
    @IBOutlet weak var myLabel3: UILabel!
    @IBOutlet weak var mySlider1: UISlider!
    
    @IBOutlet weak var mySlider2: UISlider!
    @IBAction func mudou(_ sender: UISlider) {
        if sender == mySlider1{
        myLabel1.text = String(Int(sender.value))
    }
        else{
            myLabel2.text = String(Int(sender.value))
        }
        if mySlider1.value < mySlider2.value{
            myLabel3.text = "O segundo é maior"
        }
        else if mySlider1.value > mySlider2.value{
            myLabel3.text = "O primeiro é maior"
        }
        else if mySlider1.value == mySlider2.value {
            myLabel3.text = "São iguais"
        }
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }


}

