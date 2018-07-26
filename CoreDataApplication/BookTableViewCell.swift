//
//  BookTableViewCell.swift
//  CoreDataApplication
//
//  Created by QishengTang on 2018/7/24.
//  Copyright © 2018年 QishengTang. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var bookName: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var press: UILabel!
    var book:Book!{
        didSet{
            self.bookName.text = book.bookName
            self.author.text = book.author?.authorName
            self.price.text = String.init(format: "$%.2f", book.price)
            self.press.text = book.press
            self.setNeedsLayout()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
}
