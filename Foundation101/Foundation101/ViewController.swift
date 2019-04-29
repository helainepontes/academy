//
//  ViewController.swift
//  Foundation101
//
//  Created by Helaine Alves Pontes on 20/03/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import UIKit

class minhaViewController: UIViewController {
    

    
    @IBOutlet weak var minhaLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        minhaLabel.text = "Aperte o botão"
    }

    @IBAction func didTypeButton(_ sender: UIButton) {
        minhaLabel.text = "Botão clicado com sucesso."
        
        if minhaLabel.textColor == .red{
            minhaLabel.textColor = .blue
        }
        else{
            minhaLabel.textColor = .red
        }
    }
    
}
