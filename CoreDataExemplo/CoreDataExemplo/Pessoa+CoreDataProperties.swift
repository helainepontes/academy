//
//  Pessoa+CoreDataProperties.swift
//  CoreDataExemplo
//
//  Created by Helaine Alves Pontes on 05/04/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.


import Foundation
import CoreData


extension Pessoa {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pessoa> {
        return NSFetchRequest<Pessoa>(entityName: "Pessoa")
    }

    
    @NSManaged public var nome: String?
    @NSManaged public var idade: Int32
    @NSManaged public var fone: String?
    
    class func insere(nome: String, fone: String, idade: Int32) -> Bool {
        let context = CoreDataMAnager.persistentContainer.viewContext
        
        let p = Pessoa.buscarComNome(nome: nome)
        
        if let p = p{
            print("A pessoa \(p.nome!) já existe no banco")
            return false
        }
        
        //buscar alguém com esse nome e parar de inserir se já tiver
        
        let person = Pessoa(context: context)
        person.nome = nome
        person.fone = fone
        person.idade = idade
        
        CoreDataMAnager.saveContext()
        
        return true
    }

    class func alterar(nome: String, fone: String, idade: Int32) -> Bool{
        let p = Pessoa.buscarComNome(nome: nome)
        
        if let p = p{
            p.fone = fone
            p.idade = idade
            
            CoreDataMAnager.saveContext()
            return true
        }
        return false
    }
    
    
    class func remove(nome: String) -> Bool{
        let context = CoreDataMAnager.persistentContainer.viewContext
        
        let p = Pessoa.buscarComNome(nome: nome)
        
        if let p = p{
            context.delete(p)
            return true
        }
        return false
    }
    
    
    
    class func buscarTodos() -> [Pessoa] {
        let context = CoreDataMAnager.persistentContainer.viewContext
        let request =  NSFetchRequest<Pessoa>(entityName: "Pessoa")
        do{
            let pessoas = try context.fetch(request)
            return pessoas
        }catch{
            print("Pessoa: erro ao buscarTodos()")
        }
        return []
    }
    
    
    class func buscarComNome(nome: String) -> Pessoa?{
        let context = CoreDataMAnager.persistentContainer.viewContext
        let request =  NSFetchRequest<Pessoa>(entityName: Pessoa.entity().managedObjectClassName)
        let predicate = NSPredicate(format: "nome == %@", nome)
        
        
        request.predicate = predicate
        
        do{
            let pessoas = try context.fetch(request)
            return pessoas.count > 0 ? pessoas[0] : nil
        }catch{
            print("Pessoa: erro no buscarComNome()")
        }
        
        return nil
    }
    
    
    class func buscarPor(nome: String, eFone: String) -> [Pessoa] {
        let context = CoreDataMAnager.persistentContainer.viewContext
        let request =  NSFetchRequest<Pessoa>(entityName: Pessoa.entity().managedObjectClassName)
        
        let predicate1 = NSPredicate(format: "nome == [cd] %@", nome)
        let predicate2 = NSPredicate(format: "fone == %@", eFone)
        
        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [predicate1,predicate2])
        request.predicate = compoundPredicate
        do{
            let pessoas = try context.fetch(request)
            return pessoas
        }catch{
            print("Erro ao buscarPor()")
        }
        return []
    }
    
    class func buscarNomeQue(iniciaCom nome: String) -> [Pessoa]{
        let context = CoreDataMAnager.persistentContainer.viewContext
        let request =  NSFetchRequest<Pessoa>(entityName: Pessoa.entity().managedObjectClassName)
        let predicate1 = NSPredicate(format: "nome BEGINSWITH [cd] %@", nome)
        request.predicate = predicate1
        do{
            let pessoas = try context.fetch(request)
            return pessoas
        }catch{
            print("Erro ao buscarPor()")
        }
        return []
    }
    
    class func buscarNomeCom(essaSubstring nome: String) -> [Pessoa]{
        let context = CoreDataMAnager.persistentContainer.viewContext
        let request =  NSFetchRequest<Pessoa>(entityName: Pessoa.entity().managedObjectClassName)
        let predicate1 = NSPredicate(format: "nome LIKE [cd] %@", nome)
        request.predicate = predicate1
        do{
            let pessoas = try context.fetch(request)
            return pessoas
        }catch{
            print("Erro ao buscarPor()")
        }
        return []
    }
    
    class func buscarNome2Com(essaSubstring nome: String) -> [Pessoa]{
        let context = CoreDataMAnager.persistentContainer.viewContext
        let request =  NSFetchRequest<Pessoa>(entityName: Pessoa.entity().managedObjectClassName)
        let predicate1 = NSPredicate(format: "nome LIKE [cd] %@", nome)
        let sortDescriptor = NSSortDescriptor(key: "nome", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        request.predicate = predicate1
        
        do{
            let pessoas = try context.fetch(request)
            return pessoas
        }catch{
            print("Erro ao buscarPor()")
        }
        return []
    }
}
