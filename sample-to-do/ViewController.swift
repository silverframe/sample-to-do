//
//  ViewController.swift
//  sample-to-do
//
//  Created by Stefanie Seah on 23/9/17.
//  Copyright © 2017 Stefanie Seah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var todoItems: [String] = [String]()

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func addNewToDoButtonTapped(_ sender: AnyObject) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "AddNewToDoViewController") as? AddNewToDoViewController else {
            return
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let nib = UINib(nibName: "ToDoTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "ToDoTableViewCell")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem = editButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.blue
        
        todoItems.append("Feed the dog")
        todoItems.append("Marinade chicken")
        todoItems.append("Wash clothes")
        todoItems.append("Pay telco bill")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    @IBAction func unwindToViewController(segue:UIStoryboardSegue) {
        if segue.identifier == "unwindSegue" {
            guard let vc = segue.source as? AddNewToDoViewController, let todo = vc.addNewToDoTextField.text else {
                return
                
            }
            todoItems.append(todo)
            tableView.reloadData()
        }
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") else {
            return UITableViewCell()
        }
        cell.textLabel?.text = todoItems[indexPath.row]
        return cell 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count
    }
    
}

extension ViewController: UITableViewDelegate {
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else {
            return
        }
        cell.contentView.backgroundColor = UIColor.yellow
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = UIColor.white
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todoItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return isEditing
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let sourceItemIndexpath: Int = sourceIndexPath.row
        let destinationItemIndexpath: Int = destinationIndexPath.row
        let toDoItem = todoItems[sourceItemIndexpath]
        
        if sourceItemIndexpath != destinationItemIndexpath {
            todoItems.swapAt(destinationIndexPath.row, sourceIndexPath.row)
        } else {
            todoItems.insert(toDoItem, at: destinationItemIndexpath)
            todoItems.remove(at: sourceItemIndexpath)
        }
        
    }
    
}
