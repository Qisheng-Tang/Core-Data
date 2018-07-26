//
//  Book+CoreDataProperties.swift
//  CoreDataApplication
//
//  Created by QishengTang on 2018/7/24.
//  Copyright © 2018年 QishengTang. All rights reserved.
//
//

import Foundation
import CoreData


extension Book {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Book> {
        return NSFetchRequest<Book>(entityName: "Book")
    }

    @NSManaged public var bookName: String?
    @NSManaged public var press: String?
    @NSManaged public var price: Float
    @NSManaged public var author: Author?

}
