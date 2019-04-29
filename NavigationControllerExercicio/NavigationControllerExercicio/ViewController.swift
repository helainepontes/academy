//
//  ViewController.swift
//  NavigationControllerExercicio
//
//  Created by Helaine Alves Pontes on 27/03/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButtonRed: UIButton!
    
    @IBOutlet weak var myButtonGreen: UIButton!
    
    @IBOutlet weak var myButtonBlue: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func pressButton(_ sender: UIButton) {
        performSegue(withIdentifier: "Tela02", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Tela02" {
            guard let second = segue.destination as? SecondViewController else {
                return
            }
            
            if let botao = sender as? UIButton {
                if botao == myButtonRed{
                    second.texto = "Red"
                }
                else if botao == myButtonGreen{
                    second.texto = "Green"
                }
                else if botao == myButtonBlue{
                    second.texto = "Blue"
                }
            }
        
        }
    }
}

