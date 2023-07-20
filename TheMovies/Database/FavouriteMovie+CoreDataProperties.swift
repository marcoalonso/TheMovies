//
//  FavouriteMovie+CoreDataProperties.swift
//  TheMovies
//
//  Created by Marco Alonso Rodriguez on 19/07/23.
//
//

import Foundation
import CoreData


extension FavouriteMovie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavouriteMovie> {
        return NSFetchRequest<FavouriteMovie>(entityName: "FavouriteMovie")
    }

    @NSManaged public var id: Int64
    @NSManaged public var fecha: String?
    @NSManaged public var urlposter: String?
    @NSManaged public var titulo: String?
    @NSManaged public var descripcion: String?

}

extension FavouriteMovie : Identifiable {

}
