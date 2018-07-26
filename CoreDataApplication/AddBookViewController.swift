//
//  AddBookViewController.swift
//  CoreDataApplication
//
//  Created by QishengTang on 2018/7/24.
//  Copyright © 2018年 QishengTang. All rights reserved.
//

import UIKit

class AddBookViewController: UIViewController {
    @IBOutlet weak var bookTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var pressTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    var book:Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Book"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Save", style: .plain, target: self, action: #selector(saveClick))
        if(self.book != nil){
            self.bookTextField.text = self.book?.bookName
            self.priceTextField.text = String.init(format: "%.2f", (self.book?.price)!)
            self.pressTextField.text = self.book?.press
            self.authorTextField.text = self.book?.author?.authorName
        }
    }
    @objc func saveClick() -> Void{
        let bookName = self.bookTextField.text
        let press = self.pressTextField.text
        let price = self.priceTextField.text
        let author = self.authorTextField.text
        if((bookName?.count)! > 0 && (price?.count)! > 0 && (press?.count)! > 0 && (author?.count)! > 0){
            if let bookPrice = Float(price!){
                if(self.book != nil){
                    CoreDataManager.updateBook(originBook: self.book!, bookName: bookName!, press: press!, price: bookPrice, author: author!)
                    self.navigationController?.popViewController(animated: true)
                }else{
                    CoreDataManager.addBook(bookName: bookName!, press: press!, price: bookPrice, author: author!)
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
}
