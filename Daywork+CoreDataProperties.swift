//
//  Daywork+CoreDataProperties.swift
//  
//
//  Created by faisal on 09/05/1443 AH.
//
//

import Foundation
import CoreData


extension Daywork {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Daywork> {
        return NSFetchRequest<Daywork>(entityName: "Daywork")
    }

    @NSManaged public var day: [String]?
    @NSManaged public var daykey: [Int]?

}
