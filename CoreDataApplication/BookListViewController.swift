//
//  BookListViewController.swift
//  CoreDataApplication
//
//  Created by QishengTang on 2018/7/24.
//  Copyright © 2018年 QishengTang. All rights reserved.
//

import UIKit

class BookListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var dataArray:[Book] = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "BookList"
        self.tableView.register(UINib.init(nibName: "BookTableViewCell", bundle: nil), forCellReuseIdentifier: "BookTableViewCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 120
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadData()
    }
    func loadData() -> Void {
        self.dataArray.removeAll()
        self.dataArray = CoreDataManager.fearchAllBooks()
        self.tableView.reloadData()
    }
    // MARK --- UITableViewDelegate,UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as! BookTableViewCell
        cell.book = self.dataArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let bookVc = storyBoard.instantiateViewController(withIdentifier: "AddBookViewController") as! AddBookViewController
        bookVc.book = self.dataArray[indexPath.row]
        self.navigationController?.pushViewController(bookVc, animated: true)
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Delete"
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            CoreDataManager.deleteBook(book: self.dataArray[indexPath.row])
            self.loadData()
        }
    }
    @IBAction func addClick(_ sender: Any) {
       let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
       let bookVc = storyBoard.instantiateViewController(withIdentifier: "AddBookViewController")
       self.navigationController?.pushViewController(bookVc, animated: true)
    }
    
}
