//
//  Students+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by ASWIN A on 30/11/23.
//
//

import Foundation
import CoreData


extension Students {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Students> {
        return NSFetchRequest<Students>(entityName: "Students")
    }

    @NSManaged public var sName: String?
    @NSManaged public var sId: UUID?
    @NSManaged public var sDpt: String?

}

extension Students : Identifiable {

}
