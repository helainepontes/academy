//
//  ViewController.swift
//  SortearBandeiras
//
//  Created by Helaine Alves Pontes on 22/03/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    
    var flags = ["Argentina","Australia","Brazil","Canada","Chile"]

    

    @IBOutlet weak var myPickerView1: UIPickerView!
    
    @IBOutlet weak var myLabel1: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myPickerView1.delegate = self
        myPickerView1.dataSource = self
        
    }
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
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
    
    @IBAction func myButton1(_ sender: UIButton) {
        var random1 = Int.random(in: 0...4)
        var random2 = Int.random(in: 0...4)
        var random3 = Int.random(in: 0...4)
        myPickerView1.selectRow(random1, inComponent: 0, animated: true)
        myPickerView1.selectRow(random2, inComponent: 1, animated: true)
        myPickerView1.selectRow(random3, inComponent: 2, animated: true)
        if random1 == random2 && random1 == random3{
            myLabel1.text = "Você ganhou!!!!   :)"
        }
        else{
            myLabel1.text = "Tente outra vez!   :("
        }
    }

}

