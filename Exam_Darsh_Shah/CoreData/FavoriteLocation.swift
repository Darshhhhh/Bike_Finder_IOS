//
//  FavoriteLocation.swift
//  Exam_Darsh_Shah
//
//  Created by Darsh on 2025-07-07.
//


import CoreData

@objc(FavoriteLocation) // this is core data backed obj
public class FavoriteLocation: NSManagedObject {}

extension FavoriteLocation {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteLocation> {
        NSFetchRequest<FavoriteLocation>(entityName: "FavoriteLocation")
    }

    @NSManaged public var id:       String?
    @NSManaged public var city:     String?
    @NSManaged public var country:  String?
    @NSManaged public var company:  String?
    @NSManaged public var latitude: Double
    @NSManaged public var longitude:Double
}

extension FavoriteLocation: Identifiable {}
