//
//  ViewController.swift
//  CoreDataExercicioLista
//
//  Created by Helaine Alves Pontes on 05/04/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var mySearchBar: UISearchBar!
    
    var people: [Person]? {
        didSet{
            myTableView.reloadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.dataSource = self
        mySearchBar.delegate = self
        people = Person.fetchAll()
        
    }
    
    @IBAction func myButtonAdd(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "tela02", sender: sender)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? Tela02ViewController {
            controller.delegate = self

        }
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
            cell.textLabel?.text = people?[indexPath.row].name
            cell.detailTextLabel?.text = people?[indexPath.row].phone
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return people?.count ?? 0
    }
}

extension ViewController: Tela02ViewControllerDelegate {
    func Tela02ViewController(_ controller: Tela02ViewController, didTela02NameText name: String, didTela02PhoneText phone: String) {
        
        let person = Person.insert(name: name, phone: phone)
        if let p = person {
            people?.append(p)
        }
        
        myTableView.reloadData()
    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            people = Person.fetchWith(name: searchText, orPhone: searchText)
    }


}

