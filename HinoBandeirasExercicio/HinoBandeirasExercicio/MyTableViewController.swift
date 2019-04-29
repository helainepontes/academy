//
//  MyTableViewController.swift
//  HinoBandeirasExercicio
//
//  Created by Helaine Alves Pontes on 29/03/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

    
    var bandeiras = ["Argentina","Brazil","Canada","Chile","Colombia","Belgium"]
    var continentes = ["South America","South America","North America","South America","South America","Europe"]
    var hinos = ["Oíd, mortales, el grito sagrado¡Libertad! ¡Libertad! ¡Libertad!Oíd el ruido de rotas cadenas.Ved en trono a la noble igualdad","Ouviram do Ipiranga as margens plácidas. De um povo heróico o brado retumbante,E o sol da Liberdade, em raios fúlgidos,Brilhou no céu da Pátria nesse instante.","O Canada! Our home and native land!True patriot love in all thy sons command.With glowing hearts we see thee rise","Puro, Chile, es tu cielo azulado.Puras brisas te cruzan también.Y tu campo de flores bordado.Es la copia feliz del Edén.Majestuosa es la blanca montaña","¡Oh, gloria inmarcesible!¡Oh, júbilo inmortal!En surcos de dolores.El bien germina ya.El bien germina ya¡Oh, gloria inmarcesible!","Noble Belgique, ô mère chérie.À toi nos cœurs, à toi nos bras.À toi notre sang, ô Patrie!Nous le jurons tous, tu vivras!Tu vivras toujours grande et belle"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bandeiras.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath) as? MyProfileTableViewCell else{
            fatalError("Problemas")
        }
       
            cell.myLabelBandeiras?.text = "\(bandeiras[indexPath.row])"
            cell.myLabelContinente?.text = "\(continentes[indexPath.row])"
            cell.myImageView?.image = UIImage(named: "\(bandeiras[indexPath.row])")
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 147.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       performSegue(withIdentifier: "tela02", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tela02"{
            guard let second = segue.destination as? MyViewController, let indexpath = tableView.indexPathForSelectedRow else{
                fatalError("Problemas")
            }
            
            second.selectedCont = continentes[indexpath.row]
            second.selectedFlag = bandeiras[indexpath.row]
            second.selectedHin = hinos[indexpath.row]
        }
    }

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
