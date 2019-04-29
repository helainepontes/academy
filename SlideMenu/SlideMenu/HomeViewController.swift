//
//  HomeViewController.swift
//  SlideMenu
//
//  Created by Helaine Alves Pontes on 29/04/2019.
//  Copyright © 2019 ALEXANDRE DA SILVA VALE. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var homeTableView: UITableView!
    
    var listaDisciplinaAtual = [Disciplina]()
    var formattedDate = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        formattedDate = format.string(from: date)
        
        if let weekday = getDayOfWeek(formattedDate) {
            print(weekday)
        } else {
            print("bad input")
        }
        
        listaDisciplinaAtual = filtrarDisciplinas(disciplina: Disciplina.buscarTodos(), data: formattedDate)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        listaDisciplinaAtual = filtrarDisciplinas(disciplina: Disciplina.buscarTodos(), data: formattedDate)
        homeTableView.reloadData()
    }
    
    func getDayOfWeek(_ today:String) -> String? {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let todayDate = formatter.date(from: today) else { return nil }
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        switch weekDay {
        case 1:
            return "Dom"
        case 2:
            return "Seg"
        case 3:
            return "Ter"
        case 4:
            return "Qua"
        case 5:
            return "Qui"
        case 6:
            return "Sex"
        case 7:
            return "Sab"
        default:
            return "Does not conform"
        }
    }
    
    func filtrarDisciplinas(disciplina: [Disciplina], data: String) -> [Disciplina]{
        return disciplina.filter{$0.diaSemana == getDayOfWeek(data)}
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaDisciplinaAtual.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        celula.textLabel?.text = listaDisciplinaAtual[indexPath.row].nome
        celula.detailTextLabel?.text = "Horário: \(listaDisciplinaAtual[indexPath.row].horario!)  Sala: \(listaDisciplinaAtual[indexPath.row].sala!)"
        return celula
    }

}
