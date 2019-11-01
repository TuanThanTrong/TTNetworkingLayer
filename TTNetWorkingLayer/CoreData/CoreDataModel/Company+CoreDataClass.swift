//
//  Company+CoreDataClass.swift
//  
//
//  Created by Than Trong Tuan on 9/23/19.
//
//

import Foundation
import CoreData

@objc(Company)
public class Company: NSManagedObject {
    
    static func createOrUpdateExhibitor(_ keymain: String) {
        guard let company = fetch(keymain: keymain) else {
            createWithExhibitor(keymain: keymain)
            return
        }
        CoreDataStack.saveContextWithBlock({
            company.isFavourite = !company.isFavourite
        })
    }
    static func updateWithExhibitor(keymain: String) {
      guard let company = fetch(keymain: keymain) else {
            return
        }
        CoreDataStack.saveContextWithBlock({
            company.isFavourite = !company.isFavourite
        })
    }
    
    static func negativeFavourite(company: Company) {
        CoreDataStack.saveContextWithBlock({
            company.isFavourite = !company.isFavourite
        })
    }
    
    static func createWithExhibitor(keymain: String) {
        CoreDataStack.saveContextWithBlock({
            let company = Company(context: CoreDataStack.viewContext)
            company.keymain = keymain
            company.company1 = ""
            company.company2 = ""
            company.fgPublish = ""
            company.unitExhibition = ""
            company.isFavourite = true
        })
    }
    
    static func fetchAll() -> [Company]? {
        return CoreDataStack.fetchEntity(Company.self)
    }
    
    static func checkFavourite(keymain: String) -> Bool {
        let predicate = NSPredicate(format: "%K == %@ AND %K == %@", #keyPath(Company.isFavourite), NSNumber(value: true),#keyPath(Company.keymain), keymain)
        if let _ = CoreDataStack.fetchEntity(Company.self, predicate: predicate)?.first {
            return true
        } else {
            return false
        }
    }
    static func fetchFavouriteCompany() -> [Company]? {
        let predicate = NSPredicate(format: "%K == %@", #keyPath(Company.isFavourite), NSNumber(value: true))
        return CoreDataStack.fetchEntity(Company.self, predicate: predicate)
    }
    
    static func fetch(keymain: String) -> Company? {
        let predicate = NSPredicate(format: "%K == %@", #keyPath(Company.keymain), keymain)
        return CoreDataStack.fetchEntity(Company.self, predicate: predicate)?.first
    }
    
    static func clearCached() {
        CoreDataStack.batchDeleteWithEntity(Company.self)
    }
}
