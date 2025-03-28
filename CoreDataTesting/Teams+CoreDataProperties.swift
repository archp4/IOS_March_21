//
//  Teams+CoreDataProperties.swift
//  CoreDataTesting
//
//  Created by Arch Umeshbhai Patel on 2025-03-28.
//
//

import Foundation
import CoreData


extension Teams {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Teams> {
        return NSFetchRequest<Teams>(entityName: "Teams")
    }

    @NSManaged public var team_name: String?
    @NSManaged public var team_id: UUID?
    @NSManaged public var managing_player: NSSet?

}

// MARK: Generated accessors for managing_player
extension Teams {

    @objc(addManaging_playerObject:)
    @NSManaged public func addToManaging_player(_ value: Players)

    @objc(removeManaging_playerObject:)
    @NSManaged public func removeFromManaging_player(_ value: Players)

    @objc(addManaging_player:)
    @NSManaged public func addToManaging_player(_ values: NSSet)

    @objc(removeManaging_player:)
    @NSManaged public func removeFromManaging_player(_ values: NSSet)

}

extension Teams : Identifiable {

}
