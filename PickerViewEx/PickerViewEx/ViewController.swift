//
//  ViewController.swift
//  PickerViewEx
//
//  Created by Helaine Alves Pontes on 21/03/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    //responsabilidade do datasource:
    // numero de componentes
    // numero de itens
    
    //responsabilidade do delegate:
    //preencher o picker view
    //capturar a seleção do item do pickerview
    
    @IBOutlet weak var heroeLabel: UILabel!
    
    @IBOutlet weak var viloesLabel: UILabel!
    @IBOutlet weak var myPickerView1: UIPickerView!
    
    
    var heroes = [["Superman","Batman","Mulher-Maravilha","Shazam","Aquaman"],["Coringa","Lex Lutor","Pinguim"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        myPickerView1.dataSource = self
        myPickerView1.delegate = self

    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return heroes.count
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return heroes[component].count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return heroes[component][row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let indexHeroes = pickerView.selectedRow(inComponent: 0)
        let indexVilain = pickerView.selectedRow(inComponent: 1)
        heroeLabel.text = heroes[0][indexHeroes]
        viloesLabel.text = heroes[1][indexVilain]
    }
    
}


