//
//  ViewController.swift
//  bitCoinExercicio
//
//  Created by Helaine Alves Pontes on 12/04/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var myPickerView: UIPickerView!
    
    
    @IBOutlet weak var myTextView: UITextView!
    
    var coins = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPickerView.dataSource = self
        myPickerView.delegate = self
        doDownloadKeys()
    }
    
    
    func doDownloadWebPage(coin: String){
        let httpURL = URL(string: "https://blockchain.info/ticker")!
        
        let httpTask = URLSession.shared.dataTask(with: httpURL) {
            (data, response, error) in
            if let dadosRetorno = data {
                do{
                    if let objJSON = try JSONSerialization.jsonObject(with: dadosRetorno, options: []) as? [String: Any] {
                        DispatchQueue.main.async {
                            if let coin = objJSON[coin] as? [String : Any] {
                                print("\nDados em \(coin):\n \(coin)")
                                if let price = coin["buy"] {
                                    self.myTextView.text = "Preço de compra: \(price)"
                                } else {
                                    print("Erro no buy")
                                }
                            } else {
                                print("Erro na parte \(coin)")
                            }
                        }
                    }
                } catch {
                    DispatchQueue.main.async {
                        print("Erro ao formatar retorno")
                    }
                }
            }
        }
        DispatchQueue.global(qos: .background).async {
            httpTask.resume()
        }
    }
    
    
    
    func doDownloadKeys(){
        let httpURL = URL(string: "https://blockchain.info/ticker")!
        
        let httpTask = URLSession.shared.dataTask(with: httpURL) {
            (data, response, error) in
            if let dadosRetorno = data {
                do{
                    if let objJSON = try JSONSerialization.jsonObject(with: dadosRetorno, options: []) as? [String: Any] {
                        DispatchQueue.main.async {
                            print("\n JSON completo: \n \(objJSON)")
                            let keys = objJSON.keys
                            keys.forEach({ (key) in
                                self.coins.append(key.description)
                            })
                            print("moedas", self.coins)
                            self.myPickerView.reloadAllComponents()
                        }
                    }
                } catch {
                    DispatchQueue.main.async {
                        print("Erro ao formatar retorno")
                    }
                }
            }
        }
        DispatchQueue.global(qos: .background).async {
            httpTask.resume()
        }
    }
    
    
    
    
    
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.coins.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.coins[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        doDownloadWebPage(coin: self.coins[row])
    }
}

