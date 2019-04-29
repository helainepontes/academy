//
//  TableViewController.swift
//  SlideMenu
//
//  Created by ALEXANDRE DA SILVA VALE on 25/04/2019.
//  Copyright © 2019 ALEXANDRE DA SILVA VALE. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var arrayNomeDasDisciplinas = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let d = Disciplina.searchForAll()
        return d.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        let d = Disciplina.buscarTodos()
        celula.textLabel?.text = d[indexPath.row].nome!
        return celula
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Clicou no item \(indexPath.row)")
        performSegue(withIdentifier: "detalhe", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "detalhe"){
            guard let second = segue.destination as? DetailsViewController, let indexpath = tableView.indexPathForSelectedRow else{
                fatalError("Problemas")
        }
        let d = Disciplina.buscarTodos()
            second.selectedNome = d[indexpath.row].nome
            second.selectedProf = d[indexpath.row].professor
            second.selectedSala = d[indexpath.row].sala
            second.selectedHorario = d[indexpath.row].horario
            second.selectedDia = d[indexpath.row].diaSemana
    }
    }

    
    
    
    
    
    @IBAction func add(_ sender: Any) {
        performSegue(withIdentifier: "add", sender: self)
    }
}
