//
//  Entry+CoreDataProperties.swift
//  
//
//  Created by Waranyu Khongchai on 21/4/2565 BE.
//
//

import Foundation
import CoreData


extension Entry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entry> {
        return NSFetchRequest<Entry>(entityName: "Entry")
    }

    @NSManaged public var date: Date?
    @NSManaged public var textTitle: String?
    @NSManaged public var textDetail: String?

}

extension Entry: Identifiable {
    
}
