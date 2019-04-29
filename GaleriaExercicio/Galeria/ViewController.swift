//
//  ViewController.swift
//  Galeria
//
//  Created by Helaine Alves Pontes on 22/03/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var anteriorButton: UIButton!
    
    @IBOutlet weak var proximoButton: UIButton!
    
    @IBOutlet weak var myLabel1: UILabel!
    
    @IBOutlet weak var myImageView1: UIImageView!
    
    @IBOutlet weak var adicionarButton: UIButton!
    

    var newImage: Bool?
    var image: UIImage?
    
    var flags = [UIImage(named: "Argentina"),
                 UIImage(named: "Brazil"),
                 UIImage(named: "Belgium"),
                 UIImage(named: "Canada"),
                 UIImage(named: "Chile")]
    
    var nomeflags = ["Argentina","Brazil","Belgium","Canada","Chile"]
    var indiceAtual = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //myLabel1.text = nomeflags[indiceAtual]
        myImageView1.image = flags[indiceAtual]
        
        
//        let data = try? JSONEncoder().encode(p)
//        let fm = FileHelper()
//        
//        let dataP = fm.file(at: "p1")
//        let p1 = try? JSONDecoder().decode(flags.self, from: dataP!)
//
//        let newData = try! JSONEncoder().encode(p!)
//        
        
        
        
        
    }


    @IBAction func passar(_ sender: UIButton) {
        let cont = (flags.count - 1)
        if sender == proximoButton{
            if indiceAtual < cont {
                indiceAtual += 1
                myImageView1.image = flags[indiceAtual]
                //myLabel1.text = nomeflags[indiceAtual]
            }
            else{
                indiceAtual = 0
                myImageView1.image = flags[indiceAtual]
                //myLabel1.text = nomeflags[indiceAtual]
            }
            
        }
        else{
            if indiceAtual > 0 {
                indiceAtual -= 1
                myImageView1.image = flags[indiceAtual]
                //myLabel1.text = nomeflags[indiceAtual]

            }
            else{
                indiceAtual = cont
                myImageView1.image = flags[indiceAtual]
                //myLabel1.text = nomeflags[indiceAtual]

            }
        }
    }
    
    

    @IBAction func adicionar(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerController.SourceType.savedPhotosAlbum) {
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType =
                UIImagePickerController.SourceType.photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true,
                         completion: nil)
            newImage = false
        }

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        flags.append(image)
        let name = "nova imagem"
        nomeflags.append(name)
    }
    

    struct FileHelper {
        let manager = FileManager.default
        let mainPath  = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        func updateFile(at path: String, data: Data) -> Bool {
            let contentPath = mainPath.appendingPathComponent(path)
            do {
                try data.write(to: contentPath)
                return true
            } catch (let error) {
                print(error.localizedDescription)
                return false
            }
        }
        
        func createFile(with data: Data, name: String) -> Bool {
            let contentPath = mainPath.appendingPathComponent(name)
            print(manager.fileExists(atPath: contentPath.path))
            manager.createFile(atPath: contentPath.path, contents: data, attributes: nil)
            return manager.fileExists(atPath: contentPath.path)
        }
        
        func file(at path: String) -> Data? {
            let contentPath = mainPath.appendingPathComponent(path)
            let data = try? Data(contentsOf: contentPath)
            return data
        }
        
    }

}
