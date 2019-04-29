//
//  ViewController.swift
//  NavigationEx
//
//  Created by Helaine Alves Pontes on 27/03/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func callSecondView(_ sender: Any) {
        performSegue(withIdentifier: "Tela02", sender: nil)
    }

    @IBAction func openModal(_ sender: Any) {
       performSegue(withIdentifier: "Modal01", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Tela 02"{
            guard let second = segue.destination as? SecondViewController else{
               return
            }
            second.texto = "Teste"
        }
    }

}

