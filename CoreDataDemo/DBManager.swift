//
//  DBManager.swift
//  CoreDataDemo
//
//  Created by ASWIN A on 30/11/23.
//

import UIKit
import CoreData

class DBManager{
    static let share = DBManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataDemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    lazy var context = persistentContainer.viewContext
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchData() -> [Students]{
        var student = [Students]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Students.description())
        do{
            student = try context.fetch(fetchRequest) as! [Students]
        }catch{
            print("Error while fetching")
        }
        return student
    }

}
