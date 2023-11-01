//
//  ViewController.swift
//  TableViewNotes
//
//  Created by STANISLAV STAJILA on 10/18/23.
//

import UIKit

struct Book{
    var author: String
    var title: String
    var pages: Int
    var characters: Int
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //create an outlet for the table view
    @IBOutlet weak var tableViewOutlet: UITableView!
    @IBOutlet weak var textFieldOutlet: UITextField!
    var numbers = [3, 5, 7, 9, 12, 15]
    var books = [Book]()
    var selectedName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //attach a delegate
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        books.append(Book(author: "Seaver", title: "Figure it out", pages: 12, characters: 2))
        books.append(Book(author: "Tracy", title: "Be better", pages: 300, characters: 6))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    //populates each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")! as! CrazyCell
        cell.authorOutlet.text = books[indexPath.row].author
        cell.titleOutlet.text = books[indexPath.row].title
        cell.pagesOutlet.text = "\(books[indexPath.row].pages)"
        cell.chapterOutlet.text = "\(books[indexPath.row].characters)"
//        cell.textLabel?.text = "\(numbers[indexPath.row])"
//        cell.detailTextLabel?.text = "Hello"
     return cell
    }

    @IBAction func addAction(_ sender: UIBarButtonItem) {
        var blah = textFieldOutlet.text!
        var num = Int(blah)
        if let n = num{
            numbers.append(n)
            tableViewOutlet.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedName = books[indexPath.row].author
        print(selectedName)
            
        }
        
    }

