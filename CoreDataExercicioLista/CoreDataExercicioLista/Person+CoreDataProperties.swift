//
//  Person+CoreDataProperties.swift
//  CoreDataExercicioLista
//
//  Created by Helaine Alves Pontes on 05/04/2019.
//  Copyright © 2019 Helaine Alves Pontes. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var phone: String?

    
    
    //Inserir pessoas
    
    class func insert(name: String, phone: String) -> Person?{
        let context = CoreDataManager.persistentContainer.viewContext
        
        let personFetch = Person.fetchIn(name: name)
        
        if let p = personFetch {
            print("A pessoa \(p.name!) já existe na base de dados")
            return nil
        }
        
        let person = Person(context: context)
        
        person.name = name
        person.phone = phone
        
        CoreDataManager.saveContext()
        
        return person
    }
    
    //Procurar todos
    
    class func fetchAll() -> [Person]? {
        let context = CoreDataManager.persistentContainer.viewContext
        let request = NSFetchRequest<Person>(entityName: "Person")
        
        do{
            let persons = try context.fetch(request)
            return persons
        }catch{
            print("Erro ao fetchAll()")
        }
        return []
    }
    
    //Procurar por nome
    
    class func fetchIn(name: String) -> Person? {
        
        let context = CoreDataManager.persistentContainer.viewContext
        let request = NSFetchRequest<Person>(entityName: "Person")
        
        let predicate = NSPredicate(format: "name == [c] %@", name)
        request.predicate = predicate
        do{
            let person = try context.fetch(request)
            return person.count > 0 ? person[0] : nil
            
        }catch{
            print("Erro ao fetchIn()")
        }
        return nil
    }
    
    class func fetchWith(name: String, orPhone: String) -> [Person]? {
        let context = CoreDataManager.persistentContainer.viewContext
        let request = NSFetchRequest<Person>(entityName: "Person")
        
        let predicateName = NSPredicate(format: "name LIKE[cd] '\(name)*'", name)
        let predicatePhone = NSPredicate(format: "phone LIKE '\(orPhone)*'", orPhone)
        
        let compoundPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: [predicateName,predicatePhone])
        
        request.predicate = compoundPredicate
        
        do{
            let person = try context.fetch(request)
            
            return person
        }catch{
            print("Erro ao fetchWith()")
        }
        return []
    }
}

