//
//  AddNewToDoViewController.swift
//  sample-to-do
//
//  Created by Stefanie Seah on 23/9/17.
//  Copyright © 2017 Stefanie Seah. All rights reserved.
//

import UIKit

class AddNewToDoViewController: UIViewController {
    
    lazy var viewModel: AddNewToDoViewModel = {
        return AddNewToDoViewModel()
    }()

    @IBOutlet weak var addNewToDoTextField: UITextField!
    
    @IBAction func doneButtonTapped(_ sender: AnyObject) {
        if let toDo = addNewToDoTextField.text {
            let newToDo = ToDo(name: toDo)
            viewModel.appendNewToDo(toDo: newToDo)
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNewToDoTextField.delegate = self
        self.doneButton.isEnabled = false
    }

}

extension AddNewToDoViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let toDo = addNewToDoTextField.text {
            let newLength = toDo.utf16.count + string.utf16.count + range.length
            if newLength > 0 {
                doneButton.isEnabled = true
            } else {
                doneButton.isEnabled = false
            }
        }
        return true
    }
    
}
