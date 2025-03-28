//
//  Players+CoreDataProperties.swift
//  CoreDataTesting
//
//  Created by Arch Umeshbhai Patel on 2025-03-28.
//
//

import Foundation
import CoreData


extension Players {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Players> {
        return NSFetchRequest<Players>(entityName: "Players")
    }

    @NSManaged public var name: Int16
    @NSManaged public var player_id: UUID?
    @NSManaged public var playing_for_team: Teams?

}
