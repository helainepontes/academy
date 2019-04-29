//
//  ViewController.swift
//  ColorGuess
//
//  Created by Helaine Alves Pontes on 26/03/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView1: UIView!
    
    @IBOutlet weak var myView2: UIView!
    
    @IBOutlet weak var mySlider1: UISlider!
    
    @IBOutlet weak var mySlider2: UISlider!
    
    @IBOutlet weak var mySlider3: UISlider!
    
    @IBOutlet weak var mySegmented: UISegmentedControl!
    
    @IBOutlet weak var myLabel1: UILabel!
    
    
    @IBOutlet weak var myButton1: UIButton!
    var r = CGFloat(Float.random(in: 0...1))
    var g = CGFloat(Float.random(in: 0...1))
    var b = CGFloat(Float.random(in: 0...1))
    
    
    var y = 0.0
    var z = 0.0
    var w = 0.0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView1.backgroundColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
        

    }

    @IBAction func mudou(_ sender: UISlider) {
        myView2.backgroundColor = UIColor(displayP3Red: CGFloat(mySlider1.value), green: CGFloat(mySlider2.value), blue: CGFloat(mySlider3.value), alpha: 1)
        
        
         y = Double(abs(mySlider1.value - Float(r)))
         z = Double(abs(mySlider2.value - Float(g)))
         w = Double(abs(mySlider3.value - Float(b)))

        dificuldade(mySegmented)
        
    }
    
    @IBAction func dificuldade(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0:
            if y <= 0.2 && z <= 0.2 && w <= 0.2{
                myLabel1.text = "Você ganhou"
            }
            else{
                myLabel1.text = "Tente novamente"
            }
        case 1:
            if y <= 0.1 && z <= 0.1 && w <= 0.1{
                myLabel1.text = "Você ganhou"
            }
            else{
                myLabel1.text = "Tente Novamente"
            }
        case 2:
            if y < 0.02 && z < 0.02 && w < 0.02 {
               myLabel1.text = "Você ganhou"
            }
            else{
                myLabel1.text = "Tente Novamente"
            }
        
        default:
            myLabel1.text = "Escolha a dificuldade"
        
        }
    }
    
    @IBAction func mudarCor(_ sender: UIButton) {
         r = CGFloat(Float.random(in: 0...1))
         g = CGFloat(Float.random(in: 0...1))
         b = CGFloat(Float.random(in: 0...1))
        myView1.backgroundColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
        myLabel1.text = "Tente Novamente"
    }
    

    
}

