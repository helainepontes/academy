//
//  MyTableViewController.swift
//  ExercicioTabela
//
//  Created by Helaine Alves Pontes on 29/03/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

    @IBOutlet weak var switchBlue: UISwitch!
    
    @IBOutlet weak var switchRed: UISwitch!
    
    @IBOutlet weak var switchYellow: UISwitch!
    
    @IBOutlet weak var switchPurple: UISwitch!
    
    let defaults = UserDefaults.standard
    var newCor: UIColor?
    override func viewDidLoad() {
        super.viewDidLoad()
        var data = defaults.data(forKey: "cor")
        if data == nil{
        }else{
            newCor = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data!) as! UIColor
            tableView.backgroundColor = newCor
        }
        verificarCor(newCor)
        
    }
    
    @IBAction func changeColor(_ sender: UISwitch) {
        if sender == switchBlue && switchBlue.isOn == true {
            tableView.backgroundColor = .blue
            switchYellow.isOn = false
            switchRed.isOn = false
            switchPurple.isOn = false
            guardarCor(.blue)
        }
        else if sender == switchPurple && switchPurple.isOn == true{
            tableView.backgroundColor = .purple
            switchYellow.isOn = false
            switchRed.isOn = false
            switchBlue.isOn = false
           guardarCor(.purple)
        }
        else if sender == switchYellow && switchYellow.isOn == true{
            tableView.backgroundColor = .yellow
            switchPurple.isOn = false
            switchRed.isOn = false
            switchBlue.isOn = false
            guardarCor(.yellow)
        }
        else if sender == switchRed && switchRed.isOn == true{
            tableView.backgroundColor = .red
            switchPurple.isOn = false
            switchYellow.isOn = false
            switchBlue.isOn = false
            guardarCor(.red)
        }
        else{
            tableView.backgroundColor = .white
            guardarCor(.white)
        }
   }
    
    
    
func guardarCor(_ cor: UIColor){
    var color = try? NSKeyedArchiver.archivedData(withRootObject: cor, requiringSecureCoding: false)
    let defaults = UserDefaults.standard
        defaults.set(color, forKey: "cor")
    }
    
func verificarCor(_ color: UIColor?){
    if color == .blue{
        switchBlue.isOn = true
    }
    else if color == .purple{
        switchPurple.isOn = true
    }
    else if color == .yellow{
        switchYellow.isOn = true
    }
    else if color == .red{
        switchRed.isOn = true
    }
}
}


