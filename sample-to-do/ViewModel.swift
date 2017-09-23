//
//  ViewModel.swift
//  sample-to-do
//
//  Created by Stefanie Seah on 23/9/17.
//  Copyright © 2017 Stefanie Seah. All rights reserved.
//

import Foundation

class ViewModel {
    
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
    
}
