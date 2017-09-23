//
//  AddNewToDoViewModel.swift
//  sample-to-do
//
//  Created by Stefanie Seah on 23/9/17.
//  Copyright © 2017 Stefanie Seah. All rights reserved.
//

import Foundation

class AddNewToDoViewModel {
    
    lazy var dataManager: ToDoDataManager = {
        return ToDoDataManager()
    }()
    
    func appendNewToDo(toDo: ToDo){
        dataManager.appendNewToDo(toDo: toDo)
    }
    
}
