//
//  ViewController.swift
//  PickerViewEx2
//
//  Created by Helaine Alves Pontes on 21/03/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    @IBOutlet weak var myPickerView: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPickerView.delegate = self
        myPickerView.dataSource = self
    }
    var flags = ["Brazil","Argentina","Chile","Canada","Belgium"]
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return flags.count
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imgView = UIImageView(image: UIImage(named: flags[row]))
        imgView.frame = CGRect(origin: .zero, size: pickerView.rowSize(forComponent: component))
        imgView.contentMode = .scaleAspectFit
        return imgView
    }
}

