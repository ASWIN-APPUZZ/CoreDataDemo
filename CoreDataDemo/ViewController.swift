//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by ASWIN A on 30/11/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var students = [Students]()
    

    @IBOutlet weak var tableStudent: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableStudent.delegate = self
        tableStudent.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        students = DBManager.share.fetchData()
        tableStudent.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableStudent.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let aStudent = students[indexPath.row]
            cell.textLabel?.text = aStudent.sName
            cell.detailTextLabel?.text = aStudent.sDpt
            return cell
        }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            do{
                try DBManager.share.context.delete(students[indexPath.row])
            }catch{
                printContent("Error while deletion")
            }
            DBManager.share.saveContext()
            students.remove(at: indexPath.row)
            tableStudent.deleteRows(at: [indexPath], with: .automatic)
        }
    }

}

