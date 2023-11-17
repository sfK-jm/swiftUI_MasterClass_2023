//
//  Persistence.swift
//  Devote
//
//  Created by 성준모 on 11/15/23.
//

import CoreData

struct PersistenceController {
    // MARK: - 1. PERSISTENCE(지속성) CONTROLLER
    static let shared = PersistenceController()

    // MARK: - 2. PERSISTENCE CONTAINER
    // NSPersistentContainer는 Core Data에서 정보를 저장하고,
    // 검색하는 것을 용이케 하는 개체들의 집합
    
    //NSPersistentContainer는 상태를 관리하는 객체와 Data Model을 나타내는 객체등을 포함
    let container: NSPersistentContainer

    // MARK: - 3. INITIALZATION (load the presistence store)
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Devote")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    // MARK: - 4. PREVIEW
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for i in 0..<5 {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = "Sample task NO\(i)"
            newItem.completion = false
            newItem.id = UUID()
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()
}
