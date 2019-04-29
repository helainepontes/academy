//
//  DelegateViewController.swift
//  Foundation101
//
//  Created by Helaine Alves Pontes on 20/03/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import UIKit

class DelegateViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var NoDelegateTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTextField.delegate = self
        NoDelegateTextField.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == myTextField{
            textField.resignFirstResponder()
            return true
        }
        else{
            return false
        }
    }

}
