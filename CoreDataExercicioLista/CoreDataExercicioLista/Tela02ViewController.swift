//
//  Tela02ViewController.swift
//  CoreDataExercicioLista
//
//  Created by Helaine Alves Pontes on 05/04/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import UIKit
import CoreData

protocol Tela02ViewControllerDelegate: class {
    func Tela02ViewController(_ controller: Tela02ViewController, didTela02NameText name: String, didTela02PhoneText phone: String)
}

class Tela02ViewController: UIViewController {

    @IBOutlet weak var myTextFieldName: UITextField!
    
    @IBOutlet weak var myTextFieldPhone: UITextField!
    
    
     weak var delegate: Tela02ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func myButtonSave(_ sender: UIBarButtonItem) {
        delegate?.Tela02ViewController(self, didTela02NameText: myTextFieldName.text!, didTela02PhoneText: myTextFieldPhone.text!)
        self.navigationController?.popViewController(animated: true)
    }
    

}
