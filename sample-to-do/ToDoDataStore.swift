//
//  ToDoDataStore.swift
//  sample-to-do
//
//  Created by Stefanie Seah on 23/9/17.
//  Copyright © 2017 Stefanie Seah. All rights reserved.
//

import Foundation

class ToDoDataStore {
    
    static let sharedInstance = ToDoDataStore()
    
    var toDos: [ToDo] = [ToDo]()
    
}
