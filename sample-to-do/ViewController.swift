//
//  ViewController.swift
//  sample-to-do
//
//  Created by Stefanie Seah on 23/9/17.
//  Copyright © 2017 Stefanie Seah. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var dataManager: ToDoDataManager = {
        return ToDoDataManager()
    }()
    
    var toDos: [ToDo] {
        set {
            dataManager.toDos = newValue
        }
        
        get {
            return dataManager.toDos
        }
    }

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
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell") as? ToDoTableViewCell else {
            return UITableViewCell()
        }
        cell.toDoLabel.text = toDos[indexPath.row].name
        cell.toDoImageView.backgroundColor = toDos[indexPath.row].done ? UIColor.red : UIColor.gray
        
        return cell 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        toDos[indexPath.row].done = !toDos[indexPath.row].done
        self.tableView.reloadData()
        return
    }
    
    
}
