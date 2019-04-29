//
//  ViewController.swift
//  AppRequestWeb
//
//  Created by Helaine Alves Pontes on 11/04/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbShow: UILabel!
    
    @IBOutlet weak var lbNumChar: UILabel!
    
    @IBOutlet weak var textViewHTML: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func btnGoClick(_ sender: UIButton) {
        doDownloadWebPage()
        lbShow.text = "Caracteres Lidos:"
    }
    
    func doDownloadWebPage() {
        
        let httpURL = URL(string: "https://www.ifce.edu.br")!
        
        let httpTask = URLSession.shared.dataTask(with: httpURL) {
            (data, response, error) in
            guard let validData = data, error == nil else{
                DispatchQueue.main.async {
                    print("Error getting the website \(httpURL) \n")
                }
                return
            }
            
            let results = String(data: validData, encoding: String.Encoding.utf8) ?? "Error decoding website \(httpURL) \n"
            
            DispatchQueue.main.async {
                self.lbNumChar.text = String(results.count)
                self.textViewHTML.text = results
            }
        }
        
        DispatchQueue.global(qos: .background).async {
            httpTask.resume()
        }
    }
    
    func goGetRequest() {
        let getURL = URL(string: "https://ios-twitter.herokuapp.com/api/v1/message")!
        
        var getRequest = URLRequest(url: getURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30)
        
        getRequest.httpMethod = "GET"
        let getTask = URLSession.shared.dataTask(with: getRequest){
            (data,response,error) in
            
            if error != nil {
                print("GET Request in \(getRequest) Error: \(error!)")
            }
            
            if data != nil{
                do {
                    let resultObject = try JSONSerialization.jsonObject(with: data!,options: [])
                    
                    DispatchQueue.main.async {
                        self.textViewHTML.text = resultObject as! String
                    }
                }catch {
                    DispatchQueue.main.async {
                        print("Unable to parse JSON response in \(getRequest)")
                    }
                }
            }else {
                print("Received empty quest response from \(getRequest)")
            }
        }
        
        DispatchQueue.global(qos: .background).async {
            getTask.resume()
        }
    }
    
    func doPostRequest() {
        let postURL = URL(string: "ios-twitter.herokuapp.com/api/v1/message")!
        var postRequest = URLRequest(url: postURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30.0)
        
        postRequest.httpMethod = "POST"
        postRequest.setValue("application/json", forHTTPHeaderField: "Content-Type") //send JSON data
        postRequest.setValue("application/json", forHTTPHeaderField: "Accept") //receive JSON data
        
        let parameters: [String: Any] = ["text":"Teste no Foundation"]
        
        do{
            let JSONParams = try JSONSerialization.data(withJSONObject: parameters, options: [])
            postRequest.httpBody = JSONParams
        }catch {
            print ("Error: unable to add parameters to POST request in \(postRequest)")
        }
        
        let postTask = URLSession.shared.dataTask(with: postRequest) {
            (data,response,error) in
            if error != nil {
                print("POST Request in \(postRequest) Error\(error!)")
            }
            if data == nil{
                DispatchQueue.main.async {
                    print("Received empty response")
                }
            }else {
                do {
                    let resultObject = try JSONSerialization.jsonObject(with: data!, options: [])
                    DispatchQueue.main.async {
                        print("Results from POST \(postRequest) :\n \(resultObject)")
                    }
                }catch{
                    DispatchQueue.main.async {
                        print("Unable to parse JSON response")
                    }
                }
            }
        }
        DispatchQueue.global(qos: .background).async {
            postTask.resume()
        }
    }
    
    func doDeleteRequest(){
        let id = "5c0a9bd89ee46700049fe681" // change key here to delete
        let deleteURL = URL (string: "https://ios-twitter.herokuapp.com/api/v1/message/"+id)!
        var deleteRequest = URLRequest(url: deleteURL, cachePolicy: .useProtocolCachePolicy,timeoutInterval: 30.0)
        let deleteTask = URLSession.shared.dataTask(with: deleteRequest) {
            (data, response, error) in
            if error != nil {
                print ("DELETE Request in \(deleteRequest) Error: \(error!)")
            }
            if data == nil {
                DispatchQueue.main.async { print("Received empty response.") }
            } else {
                do {
                    let resultObject = try JSONSerialization.jsonObject(with: data!, options: [])
                    DispatchQueue.main.async {
                        print("Results from DELETE \(deleteRequest) :\n \(resultObject)")
                    }
                } catch {
                    DispatchQueue.main.async {
                        print("Unable to parse JSON response")
                    }
                }
            }
        }
        DispatchQueue.global(qos: .background).async { deleteTask.resume()
        }
    }
    
    func doPutRequest() {
        
        let id = "5c0abc0df75b9b00043d8509"
        let putURL = URL(string: "ios-twitter.herokuapp.com/api/v1/message/"+id)!
        var putRequest = URLRequest(url: putURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 30.0)
        
        putRequest.httpMethod = "POST"
        putRequest.setValue("application/json", forHTTPHeaderField: "Content-Type") //send JSON data
        putRequest.setValue("application/json", forHTTPHeaderField: "Accept") //receive JSON data
        
        let parameters: [String: Any] = ["text":"Teste no Foundation"]
        
        do{
            let JSONParams = try JSONSerialization.data(withJSONObject: parameters, options: [])
            putRequest.httpBody = JSONParams
        }catch {
            print ("Error: unable to add parameters to POST request in \(putRequest)")
        }
        
        let putTask = URLSession.shared.dataTask(with: putRequest) {
            (data,response,error) in
            if error != nil {
                print("PUT Request in \(putRequest) Error\(error!)")
            }
            if data == nil{
                DispatchQueue.main.async {
                    print("Received empty response")
                }
            }else {
                do {
                    let resultObject = try JSONSerialization.jsonObject(with: data!, options: [])
                    DispatchQueue.main.async {
                        print("Results from PUT \(putRequest) :\n \(resultObject)")
                    }
                }catch{
                    DispatchQueue.main.async {
                        print("Unable to parse JSON response")
                    }
                }
            }
        }
        DispatchQueue.global(qos: .background).async {
            putTask.resume()
        }
    }
}

