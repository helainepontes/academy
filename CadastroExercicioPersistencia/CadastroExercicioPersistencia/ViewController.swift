//
//  ViewController.swift
//  CadastroExercicioPersistencia
//
//  Created by Helaine Alves Pontes on 04/04/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//               bit.ly/2YOvdKl - Exercícios Resolvidos do Yuri
//               bit.ly/2CZ03Gz - Exercícios Resolvidos do Davi



import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var myTextField: UITextField!
    
    @IBOutlet weak var myTableView: UITableView!
    
    var people = [Pessoas]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        people = try! ManagedCoreData.shared.context.fetch(Pessoas.fetchRequest())
    }
    @IBAction func cadastrarButton(_ sender: UIButton) {
        let pessoa = Pessoas(context: ManagedCoreData.shared.context)
        pessoa.name = myTextField.text
        people.append(pessoa)
        ManagedCoreData.shared.saveContext()
        myTableView.reloadData()
        
        myTextField.text = ""
    }
    
}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = people[indexPath.row].name
            return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }
}

