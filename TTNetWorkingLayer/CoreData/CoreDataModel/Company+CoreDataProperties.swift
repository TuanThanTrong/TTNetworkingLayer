//
//  Company+CoreDataProperties.swift
//  
//
//  Created by Than Trong Tuan on 9/23/19.
//
//

import Foundation
import CoreData


extension Company {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Company> {
        return NSFetchRequest<Company>(entityName: "Company")
    }

    @NSManaged public var acceptNo: String?
    @NSManaged public var company1: String?
    @NSManaged public var company2: String?
    @NSManaged public var fgPublish: String?
    @NSManaged public var keymain: String?
    @NSManaged public var unitExhibition: String?
    @NSManaged public var isFavourite: Bool

}
