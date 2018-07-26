//
//  CoreDataManager.swift
//  CoreDataApplication
//
//  Created by QishengTang on 2018/7/24.
//  Copyright © 2018年 QishengTang. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    class func fearchAllBooks() -> [Book]{
        let app = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Book>(entityName:"Book")
        do {
            let fetchedObjects = try context.fetch(fetchRequest)
            return fetchedObjects
        }
        catch {
            fatalError("save error：\(error)")
        }
    }
    
    class func addBook(bookName:String,press:String,price:Float,author:String) -> Void {
        let app:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let book = NSEntityDescription.insertNewObject(forEntityName: "Book", into: context) as! Book
        book.bookName = bookName
        book.press = press
        book.price = price
        let authorEntity = NSEntityDescription.insertNewObject(forEntityName: "Author", into: context) as! Author
        authorEntity.authorName = author
        book.author = authorEntity
        do {
            try context.save()
        } catch {
            fatalError("save error：\(error)")
        }
    }
    
    class func updateBook(originBook:Book,bookName:String,press:String,price:Float,author:String) -> Void {
        let app:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fearchArray:[Book] = self.fearchAllBooks()
        for tmpBook in fearchArray {
            if(tmpBook.author?.authorName == originBook.author?.authorName && tmpBook.bookName == originBook.bookName){
                tmpBook.bookName = bookName
                tmpBook.price = price
                tmpBook.press = press
                tmpBook.author?.authorName = author
                let set = context.updatedObjects
                print(set)
                break
            }
        }
        app.saveContext()
    }

    class func deleteBook(book:Book) -> Void {
        let app:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = app.persistentContainer.viewContext
        let fearchArray:[Book] = self.fearchAllBooks()
        for tmpBook in fearchArray {
            if(tmpBook.author?.authorName == book.author?.authorName && tmpBook.bookName == book.bookName && tmpBook.price == book.price && tmpBook.press == book.press){
                context.delete(tmpBook)
                break
            }
        }
        app.saveContext()
    }
    
}
