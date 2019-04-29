//
//  CadastroViewController.swift
//  SlideMenu
//
//  Created by ALEXANDRE DA SILVA VALE on 25/04/2019.
//  Copyright © 2019 ALEXANDRE DA SILVA VALE. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UIPickerViewDelegate,UIPickerViewDataSource {

    
    @IBOutlet weak var nomeDisciplinaText: UITextField!
    @IBOutlet weak var salaText: UITextField!
    
    @IBOutlet weak var professorText: UITextField!
    @IBOutlet weak var horaPickerView: UIPickerView!
    @IBOutlet weak var semanasCollection: UICollectionView!
    
    var horarioString = ""
    var diaSemanaString = [String]()
    
    var dias = ["Dom","Seg","Ter","Qua","Qui","Sex","Sab"]
    var horas = [["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23"],[":"],["00","01","02","03","04","05","06","07","08","09","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        semanasCollection.delegate = self
        semanasCollection.dataSource = self
        semanasCollection.allowsMultipleSelection = true
        horaPickerView.delegate = self
        horaPickerView.dataSource = self
    }
    
    
    @IBAction func saveCadastro(_ sender: UIBarButtonItem) {
       let indexPaths = semanasCollection.indexPathsForSelectedItems
        for i in indexPaths!{
            diaSemanaString.append(dias[i.row])
        }
        Disciplina.inserir(nome: nomeDisciplinaText.text!, sala: salaText.text!, professor: professorText.text!, horario: horarioString, diaSemana: diaSemanaString.first!)
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cancelCadastro(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    //-------------------------Funções do CollectionView--------------------------------------------------------------------------------
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dias.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "cellCollection", for: indexPath) as? SemanaCollectionViewCell else {
            fatalError("Collection celula error")
        }
        celula.diasLabel?.text = dias[indexPath.row]
        return celula
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let celulaAtual = collectionView.cellForItem(at: indexPath)
        celulaAtual?.backgroundColor = #colorLiteral(red: 0.8352941176, green: 0.9529411765, blue: 1, alpha: 1)
        celulaAtual?.layer.cornerRadius = 8
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let celulaAtual = collectionView.cellForItem(at: indexPath)
        celulaAtual?.backgroundColor = .clear
    }
    //-----------------Funções  do PickerView------------------------------------------------------------------------------------
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return horas.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return horas[component].count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return horas[component][row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let indexHora = pickerView.selectedRow(inComponent: 0)
        let indexMinuto = pickerView.selectedRow(inComponent: 2)
        let hora = horas[0][indexHora]
        let minuto = horas[2][indexMinuto]
        horarioString = hora + ":" + minuto
        print(horarioString)
    }
}


