//
//  Author+CoreDataProperties.swift
//  CoreDataApplication
//
//  Created by QishengTang on 2018/7/24.
//  Copyright © 2018年 QishengTang. All rights reserved.
//
//

import Foundation
import CoreData


extension Author {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Author> {
        return NSFetchRequest<Author>(entityName: "Author")
    }

    @NSManaged public var authorName: String?

}
