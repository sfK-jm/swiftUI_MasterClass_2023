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
        
        //inMemory가 true일 경우, 영구 저장소의 URL을 /dev/null로 설정하여 메모리에서만 작업함
        // 따라서 실제로는 영구 저장소를 사용하지 않고, 앱이 종료될 때 데이터가 지워짐
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        // 영구 저장소를 로드
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            // 에러 발생시
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        // NSManagedObjectContext의 automaticallyMergesChangesFromParent 속성을 true로 설정하여 부모 컨텍스트에서 발생한 변경 사항이 자동으로 병합
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    // MARK: - 4. PREVIEW
    static var preview: PersistenceController = {
        // inMemory 매개변수를 true로 설정하여 메모리에서 작업하는 PersistenceController의 인스턴스를 생성
        let result = PersistenceController(inMemory: true)
        
        // result의 container에서 viewContext를 가져와서 데이터 작업에 사용
        let viewContext = result.container.viewContext
        
        // 샘플 데이터 생성
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
            // 에러가 발생시
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        // 설정된 PersistenceController 인스턴스를 반환
        return result
    }()
}
