//
//  ToDoListModel.swift
//  Project.TodoList
//
//  Created by Waranyu Khongchai on 27/4/2565 BE.
//

import Foundation

class ToDoListModel {
    
    var id: String?
    var titleToDo: String?
    var detailToDo: String?
    
    init(id: String?, titleToDo: String?, detailToDo: String?) {
        
        self.id = id;
        self.titleToDo = titleToDo;
        self.detailToDo = detailToDo;
    }
}
