//
//  SecondViewController.swift
//  NavigationControllerExercicio
//
//  Created by Helaine Alves Pontes on 27/03/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var texto = ""
    
    @IBOutlet weak var myLabel1: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel1.text = texto
        if texto == "Red"{
            myLabel1.textColor = UIColor.red
        }
        else if texto == "Green"{
            myLabel1.textColor = UIColor.green
        }
        else if texto == "Blue"{
            myLabel1.textColor = UIColor.blue
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
