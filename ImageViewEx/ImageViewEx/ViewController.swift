//
//  ViewController.swift
//  ImageViewEx
//
//  Created by Helaine Alves Pontes on 21/03/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView1: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let img1 = UIImage(named: "img1")
        let img2 = UIImage(named: "img2")
        let img3 = UIImage(named: "img3")
        myImageView1.animationImages = [img1!,img2!,img3!,img2!]
        myImageView1.animationRepeatCount = 50
        myImageView1.animationDuration = 1
        myImageView1.startAnimating()
    }


}

