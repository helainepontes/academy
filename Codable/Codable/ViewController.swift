//
//  ViewController.swift
//  Codable
//
//  Created by Helaine Alves Pontes on 02/04/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//
//             bit.ly/2CQfwsJ(código do Yuri)
//             bit.ly/2QsXPHx(slides)

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var p = Person(name: "Yuri", age: 28)
        let data = try? JSONEncoder().encode(p)
//        print(data)

//        let jsonObject = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
//        print(jsonObject)


//        let decoder =  try? JSONDecoder()
//        let newP = try? decoder?.decode(Person.self, from: data!)
//        print(newP!?.name)
        
        
        let fm = FileHelp()
//        print(fm.createFile(with: data!, name: "p1"))
//        let dataP = fm.file(at: "p1")
//        var p1 = try? JSONDecoder().decode(Person.self, from: dataP)
//        print(p1!.name)
//        p1?.name = "Carlos"
//        let newData = try! JSONEncoder().encode(p1)
//        print(fm.updateFile(at: "p1", data: newData))
//        print(fm.remove(at: "p1"))
          print(fm.file(at: "p1"))
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        //Property Lists
        let filePath = Bundle.main.url(forResource: "configs", withExtension: "plist")
        let pData = try? Data(contentsOf: filePath!)
        var format = PropertyListSerialization.PropertyListFormat.xml
        let plist = try? PropertyListSerialization.propertyList(from: pData!, options: .mutableContainersAndLeaves, format: &format)
        let dict = plist as! NSMutableDictionary
        print(dict["brilho"])
        dict["brilho"] = 65
        
        
        
        
        
        
        
        
        
        
        
        //User Defaults
        let defaults = UserDefaults.standard
//        defaults.set(25, forKey: "Idade")
        print(defaults.integer(forKey: "Idade"))

    }

}











struct FileHelp {
    let manager = FileManager.default
    let mainPath = FileManager.default.urls(for: .documentDirectory , in: .userDomainMask).first!
    
    func createFile(with data: Data, name: String) -> Bool {
        let contentPath = mainPath.appendingPathComponent(name)
        manager.createFile(atPath: contentPath.path, contents: data, attributes: nil)
        return manager.fileExists(atPath: contentPath.path)
    }
    func file(at path: String) -> Data? {
        let contentPath = mainPath.appendingPathComponent(path)
        let data = try? Data(contentsOf: contentPath)
        return data
    }
    func remove(at path: String) -> Bool{
        let contentPath = mainPath.appendingPathComponent(path)
        do{
            try manager.removeItem(at: contentPath)
            return !manager.fileExists(atPath: contentPath.path)
        }
        catch(let error){
            print(error.localizedDescription)
            return false
        }
    }
    
    
    func updateFile(at path: String, data: Data) -> Bool {
        let contentPath = mainPath.appendingPathComponent(path)
        do{
            try data.write(to: contentPath)
            return true
        }
        catch (let error){
            print(error.localizedDescription)
            return false
        }
    }
}


class Person: Codable{
    var name: String
    var age: Int
    
    enum CodingKeys: String, CodingKey {
        case name = "Nome"
        case age = "Idade"
    }
    init(name: String , age: Int) {
        self.name = name
        self.age =  age
    }
}
