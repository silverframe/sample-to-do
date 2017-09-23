//
//  ToDoDataManager.swift
//  sample-to-do
//
//  Created by Stefanie Seah on 23/9/17.
//  Copyright © 2017 Stefanie Seah. All rights reserved.
//

import Foundation


class ToDoDataManager {
    
    lazy var dataStore = {
        return ToDoDataStore.sharedInstance
    }()
    
    var toDos: [ToDo] {
        set {
            dataStore.toDos = newValue
        }
        
        get {
            return dataStore.toDos
        }
    }
    
    func appendNewToDo(toDo: ToDo) {
        dataStore.toDos.append(toDo)
    }
    
}
