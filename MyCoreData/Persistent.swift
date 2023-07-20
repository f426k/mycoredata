//
//  Persistent.swift
//  MyCoreData
//
//  Created by Fuka Takashima on 2023/07/20.
//

import CoreData

struct PersistenceController {
    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "MyCoreData")

        container.loadPersistentStores(completionHandler: {(storeDescription,error) in
            if let error = error as NSError?{
                fatalError("Unresolved error \(error)")
            }
        })
    }
}
