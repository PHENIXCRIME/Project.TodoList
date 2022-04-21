//
//  TodolistViewController.swift
//  Project.TodoList
//
//  Created by Waranyu Khongchai on 21/4/2565 BE.
//

import UIKit

class TodolistViewController: UIViewController {

    @IBOutlet weak var txTitle: UILabel!
    @IBOutlet weak var imgButtonAdd: UIImageView!
    @IBOutlet weak var btnAddToDoList: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareView()
    }
    
    func prepareView() {
        
        txTitle.text = "todo list".uppercased()
        
        if let imgButton = UIImage(named: "ic_add") {
            imgButtonAdd.image = imgButton
        }
    }

    @IBAction func btnAddToDoList(_ sender: Any) {
        
        print("ToDoList")
    }
    
}
