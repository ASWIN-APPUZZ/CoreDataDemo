//
//  StudentViewController.swift
//  CoreDataDemo
//
//  Created by ASWIN A on 30/11/23.
//

import UIKit

class StudentViewController: UIViewController {
    
    @IBOutlet weak var sname: UITextField!
    @IBOutlet weak var sdpt: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addBtn(_ sender: Any) {
        if let name = sname.text, let dpt = sdpt.text{
            let newStudent = Students(context: DBManager.share.context)
            newStudent.sName = name
            newStudent.sDpt = dpt
            DBManager.share.saveContext()
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
