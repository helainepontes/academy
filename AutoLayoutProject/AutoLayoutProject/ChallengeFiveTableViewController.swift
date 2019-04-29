//
//  ChallengeFiveTableViewController.swift
//  AutoLayoutProject
//
//  Created by Davi Cabral on 17/04/2018.
//  Copyright © 2018 Davi Cabral. All rights reserved.
//

import UIKit

class ChallengeFiveTableViewController: UITableViewController {

    typealias Source = (label:String, button: String)
    
    var datasource = [Source]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datasource.append((label: "Texto completo", button: "Mudar a label da tabela"))
        datasource.append((label: "Título label da tabela", button: "Botão"))
        datasource.append((label: "Título label", button: "Título button"))
        datasource.append((label: "Título label", button: "Título button"))
        
        
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }

        let item = datasource[indexPath.row]
        cell.label.text = item.label
        cell.button.setTitle(item.button, for: .normal)
        
        return cell
    }
}
